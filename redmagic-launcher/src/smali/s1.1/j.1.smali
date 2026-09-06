.class public Ls1/j;
.super Landroid/graphics/drawable/AdaptiveIconDrawable;
.source "ClockDrawableWrapper.java"

# interfaces
.implements Ls1/d$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ls1/j$a;,
        Ls1/j$b;,
        Ls1/j$c;
    }
.end annotation


# static fields
.field public static i:Z = false

.field public static final j:J


# instance fields
.field private final g:Ls1/j$a;

.field private h:Ls1/j$a;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    .line 2
    .line 3
    const-wide/16 v1, 0x1

    .line 4
    .line 5
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    sput-wide v0, Ls1/j;->j:J

    .line 10
    .line 11
    return-void
.end method

.method private constructor <init>(Landroid/graphics/drawable/AdaptiveIconDrawable;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getForeground()Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-direct {p0, v0, p1}, Landroid/graphics/drawable/AdaptiveIconDrawable;-><init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 10
    .line 11
    .line 12
    new-instance p1, Ls1/j$a;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-direct {p1, v0}, Ls1/j$a;-><init>(Ls1/k;)V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Ls1/j;->g:Ls1/j$a;

    .line 19
    .line 20
    iput-object v0, p0, Ls1/j;->h:Ls1/j$a;

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic c(Landroid/content/res/Resources;II)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    invoke-virtual {p0, p2, p1}, Landroid/content/res/Resources;->getDrawableForDensity(II)Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static d(Landroid/os/Bundle;Ljava/util/function/IntFunction;)Ls1/j;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Bundle;",
            "Ljava/util/function/IntFunction<",
            "Landroid/graphics/drawable/Drawable;",
            ">;)",
            "Ls1/j;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    const-string v1, "com.android.launcher3.LEVEL_PER_TICK_ICON_ROUND"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {p0, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_1

    .line 13
    .line 14
    return-object v0

    .line 15
    :cond_1
    invoke-interface {p1, v1}, Ljava/util/function/IntFunction;->apply(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    instance-of v1, p1, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 26
    .line 27
    if-nez v1, :cond_2

    .line 28
    .line 29
    return-object v0

    .line 30
    :cond_2
    move-object v1, p1

    .line 31
    check-cast v1, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 32
    .line 33
    new-instance v3, Ls1/j;

    .line 34
    .line 35
    invoke-direct {v3, v1}, Ls1/j;-><init>(Landroid/graphics/drawable/AdaptiveIconDrawable;)V

    .line 36
    .line 37
    .line 38
    iget-object v4, v3, Ls1/j;->g:Ls1/j$a;

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, v4, Ls1/j$a;->a:Landroid/graphics/drawable/Drawable$ConstantState;

    .line 45
    .line 46
    const-string p1, "com.android.launcher3.HOUR_LAYER_INDEX"

    .line 47
    .line 48
    const/4 v5, -0x1

    .line 49
    invoke-virtual {p0, p1, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    iput p1, v4, Ls1/j$a;->b:I

    .line 54
    .line 55
    const-string p1, "com.android.launcher3.MINUTE_LAYER_INDEX"

    .line 56
    .line 57
    invoke-virtual {p0, p1, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    iput p1, v4, Ls1/j$a;->c:I

    .line 62
    .line 63
    const-string p1, "com.android.launcher3.SECOND_LAYER_INDEX"

    .line 64
    .line 65
    invoke-virtual {p0, p1, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    iput p1, v4, Ls1/j$a;->d:I

    .line 70
    .line 71
    const-string p1, "com.android.launcher3.DEFAULT_HOUR"

    .line 72
    .line 73
    invoke-virtual {p0, p1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    iput p1, v4, Ls1/j$a;->e:I

    .line 78
    .line 79
    const-string p1, "com.android.launcher3.DEFAULT_MINUTE"

    .line 80
    .line 81
    invoke-virtual {p0, p1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    iput p1, v4, Ls1/j$a;->f:I

    .line 86
    .line 87
    const-string p1, "com.android.launcher3.DEFAULT_SECOND"

    .line 88
    .line 89
    invoke-virtual {p0, p1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    iput p0, v4, Ls1/j$a;->g:I

    .line 94
    .line 95
    invoke-virtual {v3}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getForeground()Landroid/graphics/drawable/Drawable;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    check-cast p0, Landroid/graphics/drawable/LayerDrawable;

    .line 100
    .line 101
    invoke-virtual {p0}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    iget v2, v4, Ls1/j$a;->b:I

    .line 106
    .line 107
    if-ltz v2, :cond_3

    .line 108
    .line 109
    if-lt v2, p1, :cond_4

    .line 110
    .line 111
    :cond_3
    iput v5, v4, Ls1/j$a;->b:I

    .line 112
    .line 113
    :cond_4
    iget v2, v4, Ls1/j$a;->c:I

    .line 114
    .line 115
    if-ltz v2, :cond_5

    .line 116
    .line 117
    if-lt v2, p1, :cond_6

    .line 118
    .line 119
    :cond_5
    iput v5, v4, Ls1/j$a;->c:I

    .line 120
    .line 121
    :cond_6
    iget v2, v4, Ls1/j$a;->d:I

    .line 122
    .line 123
    if-ltz v2, :cond_8

    .line 124
    .line 125
    if-lt v2, p1, :cond_7

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_7
    invoke-virtual {p0, v2, v0}, Landroid/graphics/drawable/LayerDrawable;->setDrawable(ILandroid/graphics/drawable/Drawable;)V

    .line 129
    .line 130
    .line 131
    iput v5, v4, Ls1/j$a;->d:I

    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_8
    :goto_0
    iput v5, v4, Ls1/j$a;->d:I

    .line 135
    .line 136
    :goto_1
    sget-boolean p1, Ls1/T;->h:Z

    .line 137
    .line 138
    if-eqz p1, :cond_9

    .line 139
    .line 140
    invoke-virtual {v1}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getMonochrome()Landroid/graphics/drawable/Drawable;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    instance-of p1, p1, Landroid/graphics/drawable/LayerDrawable;

    .line 145
    .line 146
    if-eqz p1, :cond_9

    .line 147
    .line 148
    new-instance p1, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 149
    .line 150
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    .line 151
    .line 152
    invoke-direct {v0, v5}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v1}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getMonochrome()Landroid/graphics/drawable/Drawable;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    invoke-direct {p1, v0, v1}, Landroid/graphics/drawable/AdaptiveIconDrawable;-><init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v4, p1}, Ls1/j$a;->b(Landroid/graphics/drawable/Drawable;)Ls1/j$a;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    iput-object p1, v3, Ls1/j;->h:Ls1/j$a;

    .line 171
    .line 172
    :cond_9
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-virtual {v4, p1, p0}, Ls1/j$a;->a(Ljava/util/Calendar;Landroid/graphics/drawable/LayerDrawable;)Z

    .line 177
    .line 178
    .line 179
    return-object v3
.end method

.method public static e(Landroid/content/Context;Ljava/lang/String;I)Ls1/j;
    .locals 1

    .line 1
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/16 v0, 0x2080

    .line 6
    .line 7
    invoke-virtual {p0, p1, v0}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Landroid/content/pm/ApplicationInfo;)Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p1, p1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    .line 16
    .line 17
    new-instance v0, Ls1/i;

    .line 18
    .line 19
    invoke-direct {v0, p0, p2}, Ls1/i;-><init>(Landroid/content/res/Resources;I)V

    .line 20
    .line 21
    .line 22
    invoke-static {p1, v0}, Ls1/j;->d(Landroid/os/Bundle;Ljava/util/function/IntFunction;)Ls1/j;

    .line 23
    .line 24
    .line 25
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    return-object p0

    .line 27
    :catch_0
    move-exception p0

    .line 28
    const-string p1, "ClockDrawableWrapper"

    .line 29
    .line 30
    const-string p2, "Unable to load clock drawable info"

    .line 31
    .line 32
    invoke-static {p1, p2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 33
    .line 34
    .line 35
    const/4 p0, 0x0

    .line 36
    return-object p0
.end method

.method private g(Landroid/graphics/drawable/LayerDrawable;I)V
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    if-eq p2, p0, :cond_0

    .line 3
    .line 4
    invoke-virtual {p1, p2}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getForeground()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    .line 6
    .line 7
    iget-object v1, p0, Ls1/j;->g:Ls1/j$a;

    .line 8
    .line 9
    iget v1, v1, Ls1/j$a;->b:I

    .line 10
    .line 11
    invoke-direct {p0, v0, v1}, Ls1/j;->g(Landroid/graphics/drawable/LayerDrawable;I)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Ls1/j;->g:Ls1/j$a;

    .line 15
    .line 16
    iget v1, v1, Ls1/j$a;->c:I

    .line 17
    .line 18
    invoke-direct {p0, v0, v1}, Ls1/j;->g(Landroid/graphics/drawable/LayerDrawable;I)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ls1/j;->g:Ls1/j$a;

    .line 22
    .line 23
    iget v1, v1, Ls1/j$a;->d:I

    .line 24
    .line 25
    invoke-direct {p0, v0, v1}, Ls1/j;->g(Landroid/graphics/drawable/LayerDrawable;I)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/AdaptiveIconDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Ls1/j;->g:Ls1/j$a;

    .line 32
    .line 33
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getForeground()Landroid/graphics/drawable/Drawable;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Landroid/graphics/drawable/LayerDrawable;

    .line 42
    .line 43
    invoke-virtual {p1, v0, p0}, Ls1/j$a;->a(Ljava/util/Calendar;Landroid/graphics/drawable/LayerDrawable;)Z

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public bridge synthetic b(Landroid/graphics/Bitmap;ILs1/b;F)Ls1/d;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ls1/j;->f(Landroid/graphics/Bitmap;ILs1/b;F)Ls1/j$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f(Landroid/graphics/Bitmap;ILs1/b;F)Ls1/j$b;
    .locals 11

    .line 1
    new-instance v0, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-direct {v0, v1, v2}, Landroid/graphics/drawable/AdaptiveIconDrawable;-><init>(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x4

    .line 20
    invoke-virtual {p3, v0, v1}, Ls1/b;->w(Landroid/graphics/drawable/Drawable;I)Landroid/graphics/Bitmap;

    .line 21
    .line 22
    .line 23
    move-result-object v8

    .line 24
    invoke-virtual {p3}, Ls1/b;->U()Ls1/U;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    iget-object v0, p0, Ls1/j;->h:Ls1/j$a;

    .line 31
    .line 32
    move-object v9, v0

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    move-object v9, v2

    .line 35
    :goto_0
    if-nez v9, :cond_1

    .line 36
    .line 37
    :goto_1
    move-object v10, v2

    .line 38
    goto :goto_2

    .line 39
    :cond_1
    invoke-virtual {p3}, Ls1/b;->b0()Landroid/graphics/Bitmap;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    goto :goto_1

    .line 44
    :goto_2
    new-instance v3, Ls1/j$b;

    .line 45
    .line 46
    iget-object v7, p0, Ls1/j;->g:Ls1/j$a;

    .line 47
    .line 48
    move-object v4, p1

    .line 49
    move v5, p2

    .line 50
    move v6, p4

    .line 51
    invoke-direct/range {v3 .. v10}, Ls1/j$b;-><init>(Landroid/graphics/Bitmap;IFLs1/j$a;Landroid/graphics/Bitmap;Ls1/j$a;Landroid/graphics/Bitmap;)V

    .line 52
    .line 53
    .line 54
    return-object v3
.end method

.method public getMonochrome()Landroid/graphics/drawable/Drawable;
    .locals 3

    .line 1
    iget-object v0, p0, Ls1/j;->h:Ls1/j$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_0
    iget-object v0, v0, Ls1/j$a;->a:Landroid/graphics/drawable/Drawable$ConstantState;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    instance-of v2, v0, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 18
    .line 19
    if-eqz v2, :cond_1

    .line 20
    .line 21
    check-cast v0, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/graphics/drawable/AdaptiveIconDrawable;->getForeground()Landroid/graphics/drawable/Drawable;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object p0, p0, Ls1/j;->h:Ls1/j$a;

    .line 28
    .line 29
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    move-object v2, v0

    .line 34
    check-cast v2, Landroid/graphics/drawable/LayerDrawable;

    .line 35
    .line 36
    invoke-virtual {p0, v1, v2}, Ls1/j$a;->a(Ljava/util/Calendar;Landroid/graphics/drawable/LayerDrawable;)Z

    .line 37
    .line 38
    .line 39
    return-object v0

    .line 40
    :cond_1
    return-object v1
.end method
