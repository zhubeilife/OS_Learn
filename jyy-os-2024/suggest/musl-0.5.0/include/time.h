#ifndef	_TIME_H
#define _TIME_H

#ifdef __cplusplus
extern "C" {
#endif

#undef NULL
#ifdef __cplusplus
#define NULL 0
#else
#define NULL ((void*)0)
#endif


#define __NEED_time_t
#define __NEED_struct_timespec
#define __NEED_clock_t
#define __NEED_clockid_t
#define __NEED_timer_t
#define __NEED_size_t
#define __NEED_pid_t

#include <bits/alltypes.h>


struct tm
{
	int tm_sec;
	int tm_min;
	int tm_hour;
	int tm_mday;
	int tm_mon;
	int tm_year;
	int tm_wday;
	int tm_yday;
	int tm_isdst;
	long __tm_gmtoff;
	const char *__tm_zone;
};

struct itimerspec
{
	struct timespec it_interval;
	struct timespec it_value;
};

#define CLOCKS_PER_SEC 1000000UL

#define CLOCK_REALTIME           0
#define CLOCK_MONOTONIC          1
#define CLOCK_PROCESS_CPUTIME_ID 2
#define CLOCK_THREAD_CPUTIME_ID  3

#define TIMER_ABSTIME 1



clock_t clock (void);
time_t time (time_t *);
double difftime (time_t, time_t);
time_t mktime (struct tm *);
size_t strftime (char *, size_t, const char *, const struct tm *);
char *strptime (const char *, const char *, struct tm *);

struct tm *gmtime (const time_t *);
struct tm *gmtime_r (const time_t *, struct tm *);
struct tm *localtime (const time_t *);
struct tm *localtime_r (const time_t *, struct tm *);

char *asctime (const struct tm *);
char *asctime_r (const struct tm *, char *);
char *ctime (const time_t *);
char *ctime_r (const time_t *, char *);


extern int daylight;
extern long timezone;
extern char *tzname[2];

void tzset (void);



int nanosleep (const struct timespec *, struct timespec *);


int clock_getres (clockid_t, struct timespec *);
int clock_gettime (clockid_t, struct timespec *);
int clock_settime (clockid_t, const struct timespec *);

int clock_nanosleep (clockid_t, int, const struct timespec *, struct timespec *);
int clock_getcpuclockid (pid_t, clockid_t *);

/* FIXME */
struct sigevent;
int timer_create (clockid_t, struct sigevent *, timer_t *);
int timer_delete (timer_t);

int timer_settime (timer_t, int, const struct itimerspec *, struct itimerspec *);
int timer_gettime (timer_t, struct itimerspec *);
int timer_getoverrun (timer_t);


extern int getdate_err;
extern struct tm *getdate (const char *);

#ifdef __cplusplus
}
#endif


#endif
