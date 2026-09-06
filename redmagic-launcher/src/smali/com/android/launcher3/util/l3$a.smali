.class Lcom/android/launcher3/util/l3$a;
.super Landroid/os/Handler;
.source "WallpaperOffsetInterpolator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/util/l3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field private final a:Landroid/view/animation/Interpolator;

.field private final b:Landroid/app/WallpaperManager;

.field private c:F

.field private d:Z

.field private e:J

.field private f:F

.field private g:F

.field private h:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->g()Landroid/os/Looper;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 8
    .line 9
    .line 10
    const/high16 v0, 0x3f000000    # 0.5f

    .line 11
    .line 12
    iput v0, p0, Lcom/android/launcher3/util/l3$a;->c:F

    .line 13
    .line 14
    sget-object v0, LJ0/h;->J:Landroid/view/animation/Interpolator;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/launcher3/util/l3$a;->a:Landroid/view/animation/Interpolator;

    .line 17
    .line 18
    invoke-static {p1}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Lcom/android/launcher3/util/l3$a;->b:Landroid/app/WallpaperManager;

    .line 23
    .line 24
    return-void
.end method

.method private a(Landroid/os/IBinder;)V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/launcher3/util/l3$a;->b:Landroid/app/WallpaperManager;

    .line 2
    .line 3
    iget p0, p0, Lcom/android/launcher3/util/l3$a;->c:F

    .line 4
    .line 5
    const/high16 v1, 0x3f000000    # 0.5f

    .line 6
    .line 7
    invoke-virtual {v0, p1, p0, v1}, Landroid/app/WallpaperManager;->setWallpaperOffsets(Landroid/os/IBinder;FF)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    new-instance p1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v0, "Error updating wallpaper offset: "

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string p1, "WPOffsetInterpolator"

    .line 30
    .line 31
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 9

    .line 1
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/os/IBinder;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_2

    .line 8
    .line 9
    :cond_0
    iget v1, p1, Landroid/os/Message;->what:I

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    const/high16 v3, 0x3f800000    # 1.0f

    .line 13
    .line 14
    const/4 v4, 0x0

    .line 15
    packed-switch v1, :pswitch_data_0

    .line 16
    .line 17
    .line 18
    goto/16 :goto_2

    .line 19
    .line 20
    :pswitch_0
    const/high16 p1, 0x3f000000    # 0.5f

    .line 21
    .line 22
    iput p1, p0, Lcom/android/launcher3/util/l3$a;->c:F

    .line 23
    .line 24
    invoke-direct {p0, v0}, Lcom/android/launcher3/util/l3$a;->a(Landroid/os/IBinder;)V

    .line 25
    .line 26
    .line 27
    iput-boolean v4, p0, Lcom/android/launcher3/util/l3$a;->d:Z

    .line 28
    .line 29
    return-void

    .line 30
    :pswitch_1
    iget p1, p0, Lcom/android/launcher3/util/l3$a;->c:F

    .line 31
    .line 32
    iget v1, p0, Lcom/android/launcher3/util/l3$a;->g:F

    .line 33
    .line 34
    invoke-static {p1, v1}, Ljava/lang/Float;->compare(FF)I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    iget p1, p0, Lcom/android/launcher3/util/l3$a;->g:F

    .line 41
    .line 42
    iput p1, p0, Lcom/android/launcher3/util/l3$a;->c:F

    .line 43
    .line 44
    invoke-direct {p0, v0}, Lcom/android/launcher3/util/l3$a;->a(Landroid/os/IBinder;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    iput-boolean v4, p0, Lcom/android/launcher3/util/l3$a;->d:Z

    .line 48
    .line 49
    return-void

    .line 50
    :pswitch_2
    iget p1, p1, Landroid/os/Message;->arg1:I

    .line 51
    .line 52
    sub-int/2addr p1, v2

    .line 53
    int-to-float p1, p1

    .line 54
    div-float p1, v3, p1

    .line 55
    .line 56
    iput p1, p0, Lcom/android/launcher3/util/l3$a;->h:F

    .line 57
    .line 58
    iget-object p0, p0, Lcom/android/launcher3/util/l3$a;->b:Landroid/app/WallpaperManager;

    .line 59
    .line 60
    invoke-virtual {p0, p1, v3}, Landroid/app/WallpaperManager;->setWallpaperOffsetSteps(FF)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :pswitch_3
    iput-boolean v2, p0, Lcom/android/launcher3/util/l3$a;->d:Z

    .line 65
    .line 66
    iget v1, p0, Lcom/android/launcher3/util/l3$a;->c:F

    .line 67
    .line 68
    iput v1, p0, Lcom/android/launcher3/util/l3$a;->f:F

    .line 69
    .line 70
    invoke-virtual {p1}, Landroid/os/Message;->getWhen()J

    .line 71
    .line 72
    .line 73
    move-result-wide v5

    .line 74
    iput-wide v5, p0, Lcom/android/launcher3/util/l3$a;->e:J

    .line 75
    .line 76
    :pswitch_4
    iget v1, p1, Landroid/os/Message;->arg1:I

    .line 77
    .line 78
    int-to-float v1, v1

    .line 79
    iget p1, p1, Landroid/os/Message;->arg2:I

    .line 80
    .line 81
    int-to-float p1, p1

    .line 82
    div-float/2addr v1, p1

    .line 83
    iput v1, p0, Lcom/android/launcher3/util/l3$a;->g:F

    .line 84
    .line 85
    :pswitch_5
    iget p1, p0, Lcom/android/launcher3/util/l3$a;->c:F

    .line 86
    .line 87
    iget-boolean v1, p0, Lcom/android/launcher3/util/l3$a;->d:Z

    .line 88
    .line 89
    if-eqz v1, :cond_3

    .line 90
    .line 91
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 92
    .line 93
    .line 94
    move-result-wide v5

    .line 95
    iget-wide v7, p0, Lcom/android/launcher3/util/l3$a;->e:J

    .line 96
    .line 97
    sub-long/2addr v5, v7

    .line 98
    long-to-float v1, v5

    .line 99
    const/high16 v7, 0x437a0000    # 250.0f

    .line 100
    .line 101
    div-float/2addr v1, v7

    .line 102
    iget-object v7, p0, Lcom/android/launcher3/util/l3$a;->a:Landroid/view/animation/Interpolator;

    .line 103
    .line 104
    invoke-interface {v7, v1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    iget v7, p0, Lcom/android/launcher3/util/l3$a;->f:F

    .line 109
    .line 110
    iget v8, p0, Lcom/android/launcher3/util/l3$a;->g:F

    .line 111
    .line 112
    sub-float/2addr v8, v7

    .line 113
    mul-float/2addr v8, v1

    .line 114
    add-float/2addr v7, v8

    .line 115
    iput v7, p0, Lcom/android/launcher3/util/l3$a;->c:F

    .line 116
    .line 117
    const-wide/16 v7, 0xfa

    .line 118
    .line 119
    cmp-long v1, v5, v7

    .line 120
    .line 121
    if-gez v1, :cond_2

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_2
    move v2, v4

    .line 125
    :goto_0
    iput-boolean v2, p0, Lcom/android/launcher3/util/l3$a;->d:Z

    .line 126
    .line 127
    goto :goto_1

    .line 128
    :cond_3
    iget v1, p0, Lcom/android/launcher3/util/l3$a;->g:F

    .line 129
    .line 130
    iput v1, p0, Lcom/android/launcher3/util/l3$a;->c:F

    .line 131
    .line 132
    :goto_1
    iget v1, p0, Lcom/android/launcher3/util/l3$a;->c:F

    .line 133
    .line 134
    invoke-static {v1, p1}, Ljava/lang/Float;->compare(FF)I

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    if-eqz p1, :cond_4

    .line 139
    .line 140
    invoke-direct {p0, v0}, Lcom/android/launcher3/util/l3$a;->a(Landroid/os/IBinder;)V

    .line 141
    .line 142
    .line 143
    iget-object p1, p0, Lcom/android/launcher3/util/l3$a;->b:Landroid/app/WallpaperManager;

    .line 144
    .line 145
    iget v1, p0, Lcom/android/launcher3/util/l3$a;->h:F

    .line 146
    .line 147
    invoke-virtual {p1, v1, v3}, Landroid/app/WallpaperManager;->setWallpaperOffsetSteps(FF)V

    .line 148
    .line 149
    .line 150
    :cond_4
    iget-boolean p1, p0, Lcom/android/launcher3/util/l3$a;->d:Z

    .line 151
    .line 152
    if-eqz p1, :cond_5

    .line 153
    .line 154
    const/4 p1, 0x3

    .line 155
    invoke-static {p0, p1, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-virtual {p0}, Landroid/os/Message;->sendToTarget()V

    .line 160
    .line 161
    .line 162
    :cond_5
    :goto_2
    return-void

    .line 163
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
