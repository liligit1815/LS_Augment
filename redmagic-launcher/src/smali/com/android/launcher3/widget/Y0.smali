.class public Lcom/android/launcher3/widget/Y0;
.super Ljava/lang/Object;
.source "WidgetManagerHelper.java"


# instance fields
.field final a:Landroid/appwidget/AppWidgetManager;

.field final b:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/widget/Y0;-><init>(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, Lcom/android/launcher3/widget/Y0;->b:Landroid/content/Context;

    .line 4
    iput-object p2, p0, Lcom/android/launcher3/widget/Y0;->a:Landroid/appwidget/AppWidgetManager;

    return-void
.end method

.method public static synthetic a(Landroid/appwidget/AppWidgetManager;Landroid/os/UserHandle;)Ljava/util/stream/Stream;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/appwidget/AppWidgetManager;->getInstalledProvidersForProfile(Landroid/os/UserHandle;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method private static b(Landroid/content/Context;)Ljava/util/stream/Stream;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/stream/Stream<",
            "Landroid/appwidget/AppWidgetProviderInfo;",
            ">;"
        }
    .end annotation

    .line 1
    const-class v0, Landroid/appwidget/AppWidgetManager;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/appwidget/AppWidgetManager;

    .line 8
    .line 9
    sget-object v1, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 10
    .line 11
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, LD1/t;

    .line 16
    .line 17
    invoke-virtual {v1}, LD1/t;->p()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {v1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    new-instance v2, Lcom/android/launcher3/widget/X0;

    .line 26
    .line 27
    invoke-direct {v2, v0}, Lcom/android/launcher3/widget/X0;-><init>(Landroid/appwidget/AppWidgetManager;)V

    .line 28
    .line 29
    .line 30
    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->flatMap(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sget-object v1, Lk2/k;->m:Lcom/android/launcher3/util/I;

    .line 35
    .line 36
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Lk2/k;

    .line 41
    .line 42
    invoke-virtual {p0}, Lk2/k;->O()Ljava/util/stream/Stream;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {v0, p0}, Ljava/util/stream/Stream;->concat(Ljava/util/stream/Stream;Ljava/util/stream/Stream;)Ljava/util/stream/Stream;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method

.method private j(Landroid/appwidget/AppWidgetProviderInfo;FF)V
    .locals 0

    .line 1
    iget p0, p1, Landroid/appwidget/AppWidgetProviderInfo;->minWidth:I

    .line 2
    .line 3
    int-to-float p0, p0

    .line 4
    div-float/2addr p0, p2

    .line 5
    mul-float/2addr p0, p3

    .line 6
    float-to-int p0, p0

    .line 7
    iput p0, p1, Landroid/appwidget/AppWidgetProviderInfo;->minWidth:I

    .line 8
    .line 9
    iget p0, p1, Landroid/appwidget/AppWidgetProviderInfo;->minHeight:I

    .line 10
    .line 11
    int-to-float p0, p0

    .line 12
    div-float/2addr p0, p2

    .line 13
    mul-float/2addr p0, p3

    .line 14
    float-to-int p0, p0

    .line 15
    iput p0, p1, Landroid/appwidget/AppWidgetProviderInfo;->minHeight:I

    .line 16
    .line 17
    iget p0, p1, Landroid/appwidget/AppWidgetProviderInfo;->minResizeWidth:I

    .line 18
    .line 19
    int-to-float p0, p0

    .line 20
    div-float/2addr p0, p2

    .line 21
    mul-float/2addr p0, p3

    .line 22
    float-to-int p0, p0

    .line 23
    iput p0, p1, Landroid/appwidget/AppWidgetProviderInfo;->minResizeWidth:I

    .line 24
    .line 25
    iget p0, p1, Landroid/appwidget/AppWidgetProviderInfo;->minResizeHeight:I

    .line 26
    .line 27
    int-to-float p0, p0

    .line 28
    div-float/2addr p0, p2

    .line 29
    mul-float/2addr p0, p3

    .line 30
    float-to-int p0, p0

    .line 31
    iput p0, p1, Landroid/appwidget/AppWidgetProviderInfo;->minResizeHeight:I

    .line 32
    .line 33
    iget p0, p1, Landroid/appwidget/AppWidgetProviderInfo;->maxResizeWidth:I

    .line 34
    .line 35
    int-to-float p0, p0

    .line 36
    div-float/2addr p0, p2

    .line 37
    mul-float/2addr p0, p3

    .line 38
    float-to-int p0, p0

    .line 39
    iput p0, p1, Landroid/appwidget/AppWidgetProviderInfo;->maxResizeWidth:I

    .line 40
    .line 41
    iget p0, p1, Landroid/appwidget/AppWidgetProviderInfo;->maxResizeHeight:I

    .line 42
    .line 43
    int-to-float p0, p0

    .line 44
    div-float/2addr p0, p2

    .line 45
    mul-float/2addr p0, p3

    .line 46
    float-to-int p0, p0

    .line 47
    iput p0, p1, Landroid/appwidget/AppWidgetProviderInfo;->maxResizeHeight:I

    .line 48
    .line 49
    return-void
.end method


# virtual methods
.method public c(ILandroid/appwidget/AppWidgetProviderInfo;Landroid/os/Bundle;)Z
    .locals 1

    .line 1
    const/16 v0, -0x64

    .line 2
    .line 3
    if-gt p1, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/widget/Y0;->a:Landroid/appwidget/AppWidgetManager;

    .line 8
    .line 9
    invoke-virtual {p2}, Landroid/appwidget/AppWidgetProviderInfo;->getProfile()Landroid/os/UserHandle;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object p2, p2, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 14
    .line 15
    invoke-virtual {p0, p1, v0, p2, p3}, Landroid/appwidget/AppWidgetManager;->bindAppWidgetIdIfAllowed(ILandroid/os/UserHandle;Landroid/content/ComponentName;Landroid/os/Bundle;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public d(Landroid/content/ComponentName;Landroid/os/UserHandle;)Lcom/android/launcher3/widget/U;
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/Y0;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 12
    .line 13
    sget v1, Landroid/util/DisplayMetrics;->DENSITY_DEVICE_STABLE:I

    .line 14
    .line 15
    int-to-float v1, v1

    .line 16
    const/high16 v2, 0x3f800000    # 1.0f

    .line 17
    .line 18
    mul-float/2addr v1, v2

    .line 19
    const/high16 v2, 0x43200000    # 160.0f

    .line 20
    .line 21
    div-float/2addr v1, v2

    .line 22
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v2}, Lcom/android/launcher3/resource/B;->s()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-nez v2, :cond_0

    .line 31
    .line 32
    invoke-static {v0, v1}, Ljava/lang/Float;->compare(FF)I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_0

    .line 37
    .line 38
    const/4 v2, 0x1

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/4 v2, 0x0

    .line 41
    :goto_0
    const-string v3, "WidgetManagerHelper"

    .line 42
    .line 43
    if-eqz v2, :cond_1

    .line 44
    .line 45
    new-instance v4, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    const-string v5, "findProvider: need recalculate widget info, density: "

    .line 51
    .line 52
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string v5, ", default: "

    .line 59
    .line 60
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v5, ", "

    .line 67
    .line 68
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    :cond_1
    new-instance v4, Lcom/android/launcher3/util/L1;

    .line 82
    .line 83
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v5

    .line 87
    invoke-direct {v4, v5, p2}, Lcom/android/launcher3/util/L1;-><init>(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0, v4}, Lcom/android/launcher3/widget/Y0;->e(Lcom/android/launcher3/util/L1;)Ljava/util/List;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 95
    .line 96
    .line 97
    move-result-object v4

    .line 98
    :cond_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 99
    .line 100
    .line 101
    move-result v5

    .line 102
    if-eqz v5, :cond_4

    .line 103
    .line 104
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v5

    .line 108
    check-cast v5, Landroid/appwidget/AppWidgetProviderInfo;

    .line 109
    .line 110
    if-eqz v2, :cond_3

    .line 111
    .line 112
    invoke-direct {p0, v5, v0, v1}, Lcom/android/launcher3/widget/Y0;->j(Landroid/appwidget/AppWidgetProviderInfo;FF)V

    .line 113
    .line 114
    .line 115
    :cond_3
    iget-object v6, v5, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 116
    .line 117
    invoke-virtual {v6, p1}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v6

    .line 121
    if-eqz v6, :cond_2

    .line 122
    .line 123
    iget-object p0, p0, Lcom/android/launcher3/widget/Y0;->b:Landroid/content/Context;

    .line 124
    .line 125
    invoke-static {p0, v5}, Lcom/android/launcher3/widget/U;->j(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)Lcom/android/launcher3/widget/U;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    return-object p0

    .line 130
    :cond_4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 133
    .line 134
    .line 135
    const-string v0, "findProvider: No App Widget Provider found for component="

    .line 136
    .line 137
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const-string p1, " user="

    .line 144
    .line 145
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    invoke-static {v3, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    .line 157
    .line 158
    const/4 p0, 0x0

    .line 159
    return-object p0
.end method

.method public e(Lcom/android/launcher3/util/L1;)Ljava/util/List;
    .locals 6
    .annotation build Landroid/annotation/TargetApi;
        value = 0x1a
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/util/L1;",
            ")",
            "Ljava/util/List<",
            "Landroid/appwidget/AppWidgetProviderInfo;",
            ">;"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/widget/Y0;->b:Landroid/content/Context;

    .line 4
    .line 5
    invoke-static {p0}, Lcom/android/launcher3/widget/Y0;->b(Landroid/content/Context;)Ljava/util/stream/Stream;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ljava/util/List;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->p()Z

    .line 25
    .line 26
    .line 27
    move-result v0
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    const-string v1, "com.zte.mifavor.launcher"

    .line 29
    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    :try_start_1
    invoke-static {}, Lx1/O;->k1()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_2

    .line 37
    .line 38
    invoke-static {}, Lk2/k;->q()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    iget-object v0, p1, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    sget-object v0, Lk2/k;->m:Lcom/android/launcher3/util/I;

    .line 53
    .line 54
    iget-object v2, p0, Lcom/android/launcher3/widget/Y0;->b:Landroid/content/Context;

    .line 55
    .line 56
    invoke-virtual {v0, v2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lk2/k;

    .line 61
    .line 62
    invoke-virtual {v0}, Lk2/k;->O()Ljava/util/stream/Stream;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-interface {v0}, Ljava/util/stream/Stream;->count()J

    .line 67
    .line 68
    .line 69
    move-result-wide v2

    .line 70
    const-wide/16 v4, 0x0

    .line 71
    .line 72
    cmp-long v0, v2, v4

    .line 73
    .line 74
    if-lez v0, :cond_1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :catch_0
    move-exception p0

    .line 78
    goto :goto_1

    .line 79
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/widget/Y0;->a:Landroid/appwidget/AppWidgetManager;

    .line 80
    .line 81
    iget-object v0, p1, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 82
    .line 83
    iget-object v1, p1, Lcom/android/launcher3/util/L1;->c:Landroid/os/UserHandle;

    .line 84
    .line 85
    invoke-virtual {p0, v0, v1}, Landroid/appwidget/AppWidgetManager;->getInstalledProvidersForPackage(Ljava/lang/String;Landroid/os/UserHandle;)Ljava/util/List;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    return-object p0

    .line 90
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/widget/Y0;->a:Landroid/appwidget/AppWidgetManager;

    .line 91
    .line 92
    iget-object v2, p1, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 93
    .line 94
    iget-object v3, p1, Lcom/android/launcher3/util/L1;->c:Landroid/os/UserHandle;

    .line 95
    .line 96
    invoke-virtual {v0, v2, v3}, Landroid/appwidget/AppWidgetManager;->getInstalledProvidersForPackage(Ljava/lang/String;Landroid/os/UserHandle;)Ljava/util/List;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iget-object v2, p1, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-eqz v1, :cond_3

    .line 107
    .line 108
    sget-object v1, Lk2/k;->m:Lcom/android/launcher3/util/I;

    .line 109
    .line 110
    iget-object p0, p0, Lcom/android/launcher3/widget/Y0;->b:Landroid/content/Context;

    .line 111
    .line 112
    invoke-virtual {v1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    check-cast p0, Lk2/k;

    .line 117
    .line 118
    invoke-virtual {p0}, Lk2/k;->O()Ljava/util/stream/Stream;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    invoke-interface {p0, v1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    check-cast p0, Ljava/util/Collection;

    .line 131
    .line 132
    invoke-interface {v0, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    .line 133
    .line 134
    .line 135
    :cond_3
    return-object v0

    .line 136
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 137
    .line 138
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 139
    .line 140
    .line 141
    const-string v1, "getAllProviders: Error getting installed providers for package="

    .line 142
    .line 143
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    iget-object p1, p1, Lcom/android/launcher3/util/L1;->a:Ljava/lang/String;

    .line 147
    .line 148
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    const-string v0, "WidgetManagerHelper"

    .line 156
    .line 157
    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 158
    .line 159
    .line 160
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 161
    .line 162
    return-object p0
.end method

.method public f()Landroid/appwidget/AppWidgetManager;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/Y0;->a:Landroid/appwidget/AppWidgetManager;

    .line 2
    .line 3
    return-object p0
.end method

.method public g(ILandroid/content/ComponentName;)Lcom/android/launcher3/widget/U;
    .locals 1

    .line 1
    const/16 v0, -0x64

    .line 2
    .line 3
    if-gt p1, v0, :cond_0

    .line 4
    .line 5
    sget-object p1, Lk2/k;->m:Lcom/android/launcher3/util/I;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/widget/Y0;->b:Landroid/content/Context;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lk2/k;

    .line 14
    .line 15
    invoke-virtual {p0, p2}, Lk2/k;->o(Landroid/content/ComponentName;)Lcom/android/launcher3/widget/U;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/Y0;->a:Landroid/appwidget/AppWidgetManager;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Landroid/appwidget/AppWidgetManager;->getAppWidgetInfo(I)Landroid/appwidget/AppWidgetProviderInfo;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    new-instance p0, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    const-string v0, "getLauncherAppWidgetInfo: AppWidgetManager returned null AppWidgetInfo for appWidgetId="

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string p1, ", componentName="

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    const-string p1, "WidgetManagerHelper"

    .line 54
    .line 55
    invoke-static {p1, p0}, Lcom/android/launcher3/logging/b;->o(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    const/4 p0, 0x0

    .line 59
    return-object p0

    .line 60
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/widget/Y0;->b:Landroid/content/Context;

    .line 61
    .line 62
    invoke-static {p0, v0}, Lcom/android/launcher3/widget/U;->j(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)Lcom/android/launcher3/widget/U;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0
.end method

.method public h(I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/Y0;->a:Landroid/appwidget/AppWidgetManager;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/appwidget/AppWidgetManager;->getAppWidgetOptions(I)Landroid/os/Bundle;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string p1, "appWidgetRestoreCompleted"

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public i(Landroid/appwidget/AppWidgetProviderInfo;I)Landroid/widget/RemoteViews;
    .locals 1

    .line 1
    invoke-static {}, Landroid/appwidget/flags/Flags;->generatedPreviews()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/widget/Y0;->a:Landroid/appwidget/AppWidgetManager;

    .line 10
    .line 11
    iget-object v0, p1, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/appwidget/AppWidgetProviderInfo;->getProfile()Landroid/os/UserHandle;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, v0, p1, p2}, Landroid/appwidget/AppWidgetManager;->getWidgetPreview(Landroid/content/ComponentName;Landroid/os/UserHandle;I)Landroid/widget/RemoteViews;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method
