.class Lcom/android/launcher3/streamer/colorpicker/d;
.super Ljava/lang/Object;
.source "ThrottledTouchEventHandler.java"


# instance fields
.field private a:I

.field private b:LT1/i;

.field private c:J


# direct methods
.method private constructor <init>(ILT1/i;)V
    .locals 2

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 3
    iput-wide v0, p0, Lcom/android/launcher3/streamer/colorpicker/d;->c:J

    .line 4
    iput p1, p0, Lcom/android/launcher3/streamer/colorpicker/d;->a:I

    .line 5
    iput-object p2, p0, Lcom/android/launcher3/streamer/colorpicker/d;->b:LT1/i;

    return-void
.end method

.method constructor <init>(LT1/i;)V
    .locals 1

    const/16 v0, 0x10

    .line 1
    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/streamer/colorpicker/d;-><init>(ILT1/i;)V

    return-void
.end method


# virtual methods
.method a(Landroid/view/MotionEvent;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/streamer/colorpicker/d;->b:LT1/i;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    iget-wide v2, p0, Lcom/android/launcher3/streamer/colorpicker/d;->c:J

    .line 11
    .line 12
    sub-long v2, v0, v2

    .line 13
    .line 14
    iget v4, p0, Lcom/android/launcher3/streamer/colorpicker/d;->a:I

    .line 15
    .line 16
    int-to-long v4, v4

    .line 17
    cmp-long v2, v2, v4

    .line 18
    .line 19
    if-gtz v2, :cond_1

    .line 20
    .line 21
    :goto_0
    return-void

    .line 22
    :cond_1
    iput-wide v0, p0, Lcom/android/launcher3/streamer/colorpicker/d;->c:J

    .line 23
    .line 24
    iget-object p0, p0, Lcom/android/launcher3/streamer/colorpicker/d;->b:LT1/i;

    .line 25
    .line 26
    invoke-interface {p0, p1}, LT1/i;->a(Landroid/view/MotionEvent;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
