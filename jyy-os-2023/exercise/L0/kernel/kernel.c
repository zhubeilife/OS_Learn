/*
 *在 AbstractMachine 中显示一张图片

你需要编写一个直接运行在 AbstractMachine 上 (仅仅启用 IOE 扩展，不使用其他硬件机制如中断/异常/虚拟存储/多处理器) 的程序，显示一张图片；满足：

1. 显示一张任何图片，但能适配不同的屏幕大小。确保你的图片在 320×200、640×480、800×600 等分辨率下均可以正常显示；
2. 图片中包含不少于 10 种颜色。
3. 程序使用的内存 (代码、静态数据总和不超过 4 MiB、堆区 `heap` 使用不超过 4 MiB)；
4. 按 ESC 键后调用 `halt()` 退出；除此之外，按任何键程序都不应退出。
*/

#include <am.h>
#include <amdev.h>
#include <klib.h>
#include <klib-macros.h>

#include "rgb.h"

#define SIDE 16

static int w, h; // Screen size

#define KEYNAME(key) \
  [AM_KEY_##key] = #key,
static const char* key_names[] = {AM_KEYS(KEYNAME)};

static inline void puts(const char* s)
{
    for (; *s; s++) putch(*s);
}

void print_key()
{
    AM_INPUT_KEYBRD_T event = {.keycode = AM_KEY_NONE};
    ioe_read(AM_INPUT_KEYBRD, &event);
    if (event.keycode != AM_KEY_NONE && event.keydown)
    {
        puts("Key pressed: ");
        puts(key_names[event.keycode]);
        puts("\n");
        if (event.keycode == AM_KEY_ESCAPE)
        {
            puts("say good night to the world!\n");
            halt(0);
        }
    }
}

// tile:瓷砖/小方块
static void draw_tile(int x, int y, int w, int h, uint32_t color)
{
    uint32_t pixels[w * h]; // WARNING: large stack-allocated memory
    AM_GPU_FBDRAW_T event = {
        .x = x, .y = y, .w = w, .h = h, .sync = 1,
        .pixels = pixels,
    };
    for (int i = 0; i < w * h; i++)
    {
        pixels[i] = color;
    }
    ioe_write(AM_GPU_FBDRAW, &event);
}

static void draw_point(int x, int y, uint32_t color)
{
    AM_GPU_FBDRAW_T event = {
        .x = x, .y = y, .w = 1, .h = 1, .sync = 1,
        .pixels = &color,
    };
    ioe_write(AM_GPU_FBDRAW, &event);
}

void splash_demo()
{
    AM_GPU_CONFIG_T info = {0};
    ioe_read(AM_GPU_CONFIG, &info);
    w = info.width;
    h = info.height;

    for (int x = 0; x * SIDE <= w; x++)
    {
        for (int y = 0; y * SIDE <= h; y++)
        {
            if ((x & 1) ^ (y & 1))
            {
                draw_tile(x * SIDE, y * SIDE, SIDE, SIDE, 0xffffff); // white
            }
        }
    }
}

int get_image_index(int x, int y, int w, int h, int image_w, int image_h)
{
    int x_convert = image_w * x / w;
    int y_convert = image_h * y / h;
    return y_convert * image_w + x_convert;
}

void test_draw_point()
{
    AM_GPU_CONFIG_T info = {0};
    ioe_read(AM_GPU_CONFIG, &info);
    w = info.width;
    h = info.height;

    for (int x = 0; x <= w / 2; x++)
    {
        for (int y = 0; y <= h / 2; y++)
        {
            draw_point(x, y, 0x00ff00);
        }
    }
}

void splash()
{
    AM_GPU_CONFIG_T info = {0};
    ioe_read(AM_GPU_CONFIG, &info);
    w = info.width;
    h = info.height;

    for (int x = 0; x <= w; x++)
    {
        for (int y = 0; y <= h; y++)
        {
            // paint point at (x, y)
            int index = get_image_index(x, y, w, h, image_w, image_h);
            unsigned char R = RGBImage[index * 3];
            unsigned char G = RGBImage[index * 3 + 1];
            unsigned char B = RGBImage[index * 3 + 2];
            uint32_t color = 0x000000;
            color |= R << 16;
            color |= G << 8;
            color |= B;
            draw_point(x, y, color);
        }
    }
}

// Operating system is a C program!
int main(const char* args)
{
    ioe_init();

    puts("mainargs = \"");
    puts(args); // make run mainargs=xxx
    puts("\"\n");

    splash();

    puts("Press any key to see its key code...\n");
    while (1)
    {
        print_key();
    }
    return 0;
}
