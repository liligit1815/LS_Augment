.class public final Lcom/android/quickstep/views/DigitalWellBeingToast;
.super Landroid/widget/TextView;
.source "DigitalWellBeingToast.kt"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "AppCompatCustomView"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/views/DigitalWellBeingToast$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/views/DigitalWellBeingToast$Companion;

.field public static final MINUTE_MS:I = 0xea60

.field private static final OPEN_APP_USAGE_SETTINGS_TEMPLATE:Landroid/content/Intent;

.field private static final TAG:Ljava/lang/String; = "DigitalWellBeingToast"

.field private static final THRESHOLD_LEFT_ICON_ONLY:F = 0.4f

.field private static final THRESHOLD_RIGHT_ICON_ONLY:F = 0.6f


# instance fields
.field private appRemainingTimeMs:J

.field private final bannerHeight:I

.field private bannerOffsetPercentage:F

.field private hasLimit:Z

.field private isDestroyed:Z

.field private final launcherApps:Landroid/content/pm/LauncherApps;

.field private final recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

.field private snapshotView:Landroid/view/View;

.field private splitBounds:Lcom/android/launcher3/util/y2$a;

.field private splitOffsetTranslationY:F

.field private stagePosition:I

.field private task:Lcom/android/systemui/shared/recents/model/Task;

.field private taskView:Lcom/android/quickstep/views/TaskView;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/views/DigitalWellBeingToast$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/views/DigitalWellBeingToast$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/views/DigitalWellBeingToast;->Companion:Lcom/android/quickstep/views/DigitalWellBeingToast$Companion;

    .line 8
    .line 9
    new-instance v0, Landroid/content/Intent;

    .line 10
    .line 11
    const-string v1, "android.settings.action.APP_USAGE_SETTINGS"

    .line 12
    .line 13
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    sput-object v0, Lcom/android/quickstep/views/DigitalWellBeingToast;->OPEN_APP_USAGE_SETTINGS_TEMPLATE:Landroid/content/Intent;

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 8

    .line 1
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v6, 0xe

    const/4 v7, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v1 .. v7}, Lcom/android/quickstep/views/DigitalWellBeingToast;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IIILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 8

    .line 2
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v6, 0xc

    const/4 v7, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v1 .. v7}, Lcom/android/quickstep/views/DigitalWellBeingToast;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IIILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 8

    .line 3
    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/16 v6, 0x8

    const/4 v7, 0x0

    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    invoke-direct/range {v1 .. v7}, Lcom/android/quickstep/views/DigitalWellBeingToast;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IIILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 5
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 6
    invoke-static {p1}, Lcom/android/quickstep/views/RecentsViewContainer;->containerFromContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/android/quickstep/views/RecentsViewContainer;

    iput-object p2, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 7
    const-class p2, Landroid/content/pm/LauncherApps;

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/content/pm/LauncherApps;

    iput-object p2, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->launcherApps:Landroid/content/pm/LauncherApps;

    .line 8
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0702af

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->bannerHeight:I

    const/4 p1, -0x1

    .line 9
    iput p1, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->stagePosition:I

    .line 10
    new-instance p1, Lcom/android/quickstep/views/g;

    invoke-direct {p1, p0}, Lcom/android/quickstep/views/g;-><init>(Lcom/android/quickstep/views/DigitalWellBeingToast;)V

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 11
    new-instance p1, Lcom/android/quickstep/views/DigitalWellBeingToast$2;

    invoke-direct {p1, p0}, Lcom/android/quickstep/views/DigitalWellBeingToast$2;-><init>(Lcom/android/quickstep/views/DigitalWellBeingToast;)V

    .line 12
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    const/4 p1, 0x1

    .line 13
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setClipToOutline(Z)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;IIILkotlin/jvm/internal/j;)V
    .locals 1

    and-int/lit8 p6, p5, 0x2

    if-eqz p6, :cond_0

    const/4 p2, 0x0

    :cond_0
    and-int/lit8 p6, p5, 0x4

    const/4 v0, 0x0

    if-eqz p6, :cond_1

    move p3, v0

    :cond_1
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_2

    move p4, v0

    .line 4
    :cond_2
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/quickstep/views/DigitalWellBeingToast;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/views/DigitalWellBeingToast;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/DigitalWellBeingToast;->openAppUsageSettings(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$getOPEN_APP_USAGE_SETTINGS_TEMPLATE$cp()Landroid/content/Intent;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/views/DigitalWellBeingToast;->OPEN_APP_USAGE_SETTINGS_TEMPLATE:Landroid/content/Intent;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic access$getSplitOffsetTranslationY$p(Lcom/android/quickstep/views/DigitalWellBeingToast;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->splitOffsetTranslationY:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Lcom/android/quickstep/views/DigitalWellBeingToast;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/views/DigitalWellBeingToast;->initialize$lambda$2(Lcom/android/quickstep/views/DigitalWellBeingToast;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/views/DigitalWellBeingToast;JJ)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/quickstep/views/DigitalWellBeingToast;->initialize$lambda$2$lambda$1(Lcom/android/quickstep/views/DigitalWellBeingToast;JJ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final getAccessibilityActionId()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->splitBounds:Lcom/android/launcher3/util/y2$a;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget v0, v0, Lcom/android/launcher3/util/y2$a;->l:I

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->task:Lcom/android/systemui/shared/recents/model/Task;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const-string p0, "task"

    .line 12
    .line 13
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    :cond_0
    iget-object p0, p0, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 18
    .line 19
    iget p0, p0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 20
    .line 21
    if-ne v0, p0, :cond_1

    .line 22
    .line 23
    const p0, 0x7f0b004b

    .line 24
    .line 25
    .line 26
    return p0

    .line 27
    :cond_1
    const p0, 0x7f0b004c

    .line 28
    .line 29
    .line 30
    return p0
.end method

.method public static synthetic getBannerText$default(Lcom/android/quickstep/views/DigitalWellBeingToast;JZILjava/lang/Object;)Ljava/lang/String;
    .locals 0

    .line 1
    and-int/lit8 p5, p4, 0x1

    .line 2
    .line 3
    if-eqz p5, :cond_0

    .line 4
    .line 5
    iget-wide p1, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->appRemainingTimeMs:J

    .line 6
    .line 7
    :cond_0
    and-int/lit8 p4, p4, 0x2

    .line 8
    .line 9
    if-eqz p4, :cond_1

    .line 10
    .line 11
    const/4 p3, 0x0

    .line 12
    :cond_1
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/quickstep/views/DigitalWellBeingToast;->getBannerText(JZ)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method private final getContentDescriptionForTask(Lcom/android/systemui/shared/recents/model/Task;JJ)Ljava/lang/String;
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long p2, p2, v0

    .line 4
    .line 5
    if-ltz p2, :cond_0

    .line 6
    .line 7
    cmp-long p2, p4, v0

    .line 8
    .line 9
    if-ltz p2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    iget-object p1, p1, Lcom/android/systemui/shared/recents/model/Task;->titleDescription:Ljava/lang/String;

    .line 16
    .line 17
    const/4 p3, 0x1

    .line 18
    invoke-virtual {p0, p4, p5, p3}, Lcom/android/quickstep/views/DigitalWellBeingToast;->getBannerText(JZ)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    filled-new-array {p1, p0}, [Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const p1, 0x7f140418

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2, p1, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_0
    iget-object p0, p1, Lcom/android/systemui/shared/recents/model/Task;->titleDescription:Ljava/lang/String;

    .line 35
    .line 36
    return-object p0
.end method

.method private final getReadableDuration(Ljava/time/Duration;I)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/time/Duration;->toHours()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {v0, v1}, Ljava/lang/Math;->toIntExact(J)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    int-to-long v1, v0

    .line 10
    invoke-virtual {p1, v1, v2}, Ljava/time/Duration;->minusHours(J)Ljava/time/Duration;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Ljava/time/Duration;->toMinutes()J

    .line 15
    .line 16
    .line 17
    move-result-wide v1

    .line 18
    invoke-static {v1, v2}, Ljava/lang/Math;->toIntExact(J)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const-string v2, "formatMeasures(...)"

    .line 23
    .line 24
    if-lez v0, :cond_0

    .line 25
    .line 26
    if-lez v1, :cond_0

    .line 27
    .line 28
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    sget-object p1, Landroid/icu/text/MeasureFormat$FormatWidth;->NARROW:Landroid/icu/text/MeasureFormat$FormatWidth;

    .line 33
    .line 34
    invoke-static {p0, p1}, Landroid/icu/text/MeasureFormat;->getInstance(Ljava/util/Locale;Landroid/icu/text/MeasureFormat$FormatWidth;)Landroid/icu/text/MeasureFormat;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    new-instance p1, Landroid/icu/util/Measure;

    .line 39
    .line 40
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    sget-object v0, Landroid/icu/util/MeasureUnit;->HOUR:Landroid/icu/util/TimeUnit;

    .line 45
    .line 46
    invoke-direct {p1, p2, v0}, Landroid/icu/util/Measure;-><init>(Ljava/lang/Number;Landroid/icu/util/MeasureUnit;)V

    .line 47
    .line 48
    .line 49
    new-instance p2, Landroid/icu/util/Measure;

    .line 50
    .line 51
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    sget-object v1, Landroid/icu/util/MeasureUnit;->MINUTE:Landroid/icu/util/TimeUnit;

    .line 56
    .line 57
    invoke-direct {p2, v0, v1}, Landroid/icu/util/Measure;-><init>(Ljava/lang/Number;Landroid/icu/util/MeasureUnit;)V

    .line 58
    .line 59
    .line 60
    filled-new-array {p1, p2}, [Landroid/icu/util/Measure;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p0, p1}, Landroid/icu/text/MeasureFormat;->formatMeasures([Landroid/icu/util/Measure;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {p0, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-object p0

    .line 72
    :cond_0
    if-lez v0, :cond_1

    .line 73
    .line 74
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    sget-object p1, Landroid/icu/text/MeasureFormat$FormatWidth;->WIDE:Landroid/icu/text/MeasureFormat$FormatWidth;

    .line 79
    .line 80
    invoke-static {p0, p1}, Landroid/icu/text/MeasureFormat;->getInstance(Ljava/util/Locale;Landroid/icu/text/MeasureFormat$FormatWidth;)Landroid/icu/text/MeasureFormat;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    new-instance p1, Landroid/icu/util/Measure;

    .line 85
    .line 86
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    sget-object v0, Landroid/icu/util/MeasureUnit;->HOUR:Landroid/icu/util/TimeUnit;

    .line 91
    .line 92
    invoke-direct {p1, p2, v0}, Landroid/icu/util/Measure;-><init>(Ljava/lang/Number;Landroid/icu/util/MeasureUnit;)V

    .line 93
    .line 94
    .line 95
    filled-new-array {p1}, [Landroid/icu/util/Measure;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {p0, p1}, Landroid/icu/text/MeasureFormat;->formatMeasures([Landroid/icu/util/Measure;)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-static {p0, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    return-object p0

    .line 107
    :cond_1
    if-lez v1, :cond_2

    .line 108
    .line 109
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    sget-object p1, Landroid/icu/text/MeasureFormat$FormatWidth;->WIDE:Landroid/icu/text/MeasureFormat$FormatWidth;

    .line 114
    .line 115
    invoke-static {p0, p1}, Landroid/icu/text/MeasureFormat;->getInstance(Ljava/util/Locale;Landroid/icu/text/MeasureFormat$FormatWidth;)Landroid/icu/text/MeasureFormat;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    new-instance p1, Landroid/icu/util/Measure;

    .line 120
    .line 121
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    sget-object v0, Landroid/icu/util/MeasureUnit;->MINUTE:Landroid/icu/util/TimeUnit;

    .line 126
    .line 127
    invoke-direct {p1, p2, v0}, Landroid/icu/util/Measure;-><init>(Ljava/lang/Number;Landroid/icu/util/MeasureUnit;)V

    .line 128
    .line 129
    .line 130
    filled-new-array {p1}, [Landroid/icu/util/Measure;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-virtual {p0, p1}, Landroid/icu/text/MeasureFormat;->formatMeasures([Landroid/icu/util/Measure;)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-static {p0, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    return-object p0

    .line 142
    :cond_2
    sget-object v0, Ljava/time/Duration;->ZERO:Ljava/time/Duration;

    .line 143
    .line 144
    invoke-virtual {p1, v0}, Ljava/time/Duration;->compareTo(Ljava/time/Duration;)I

    .line 145
    .line 146
    .line 147
    move-result p1

    .line 148
    if-lez p1, :cond_3

    .line 149
    .line 150
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    const-string p1, "getString(...)"

    .line 159
    .line 160
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    return-object p0

    .line 164
    :cond_3
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    sget-object p1, Landroid/icu/text/MeasureFormat$FormatWidth;->WIDE:Landroid/icu/text/MeasureFormat$FormatWidth;

    .line 169
    .line 170
    invoke-static {p0, p1}, Landroid/icu/text/MeasureFormat;->getInstance(Ljava/util/Locale;Landroid/icu/text/MeasureFormat$FormatWidth;)Landroid/icu/text/MeasureFormat;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    new-instance p1, Landroid/icu/util/Measure;

    .line 175
    .line 176
    const/4 p2, 0x0

    .line 177
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 178
    .line 179
    .line 180
    move-result-object p2

    .line 181
    sget-object v0, Landroid/icu/util/MeasureUnit;->MINUTE:Landroid/icu/util/TimeUnit;

    .line 182
    .line 183
    invoke-direct {p1, p2, v0}, Landroid/icu/util/Measure;-><init>(Ljava/lang/Number;Landroid/icu/util/MeasureUnit;)V

    .line 184
    .line 185
    .line 186
    filled-new-array {p1}, [Landroid/icu/util/Measure;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    invoke-virtual {p0, p1}, Landroid/icu/text/MeasureFormat;->formatMeasures([Landroid/icu/util/Measure;)Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    invoke-static {p0, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    return-object p0
.end method

.method private final getSplitBannerConfig()Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->splitBounds:Lcom/android/launcher3/util/y2$a;

    .line 2
    .line 3
    if-eqz v0, :cond_7

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 6
    .line 7
    invoke-interface {v1}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->G0:Z

    .line 12
    .line 13
    if-eqz v1, :cond_7

    .line 14
    .line 15
    iget-object v1, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    const-string v1, "taskView"

    .line 21
    .line 22
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    move-object v1, v2

    .line 26
    :cond_0
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskView;->isLargeTile()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    iget-object v1, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 34
    .line 35
    invoke-interface {v1}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->Q0:Z

    .line 40
    .line 41
    if-nez v1, :cond_2

    .line 42
    .line 43
    sget-object p0, Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;->SPLIT_GRID_BANNER_LARGE:Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_2
    iget-object p0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->task:Lcom/android/systemui/shared/recents/model/Task;

    .line 47
    .line 48
    if-nez p0, :cond_3

    .line 49
    .line 50
    const-string p0, "task"

    .line 51
    .line 52
    invoke-static {p0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    move-object v2, p0

    .line 57
    :goto_0
    iget-object p0, v2, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 58
    .line 59
    iget p0, p0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 60
    .line 61
    iget v1, v0, Lcom/android/launcher3/util/y2$a;->k:I

    .line 62
    .line 63
    if-ne p0, v1, :cond_5

    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/android/launcher3/util/y2$a;->b()F

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    const v0, 0x3ecccccd    # 0.4f

    .line 70
    .line 71
    .line 72
    cmpg-float p0, p0, v0

    .line 73
    .line 74
    if-gez p0, :cond_4

    .line 75
    .line 76
    sget-object p0, Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;->SPLIT_GRID_BANNER_SMALL:Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;

    .line 77
    .line 78
    return-object p0

    .line 79
    :cond_4
    sget-object p0, Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;->SPLIT_GRID_BANNER_LARGE:Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;

    .line 80
    .line 81
    return-object p0

    .line 82
    :cond_5
    invoke-virtual {v0}, Lcom/android/launcher3/util/y2$a;->b()F

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    const v0, 0x3f19999a    # 0.6f

    .line 87
    .line 88
    .line 89
    cmpl-float p0, p0, v0

    .line 90
    .line 91
    if-lez p0, :cond_6

    .line 92
    .line 93
    sget-object p0, Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;->SPLIT_GRID_BANNER_SMALL:Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;

    .line 94
    .line 95
    return-object p0

    .line 96
    :cond_6
    sget-object p0, Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;->SPLIT_GRID_BANNER_LARGE:Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;

    .line 97
    .line 98
    return-object p0

    .line 99
    :cond_7
    :goto_1
    sget-object p0, Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;->SPLIT_BANNER_FULLSCREEN:Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;

    .line 100
    .line 101
    return-object p0
.end method

.method private static synthetic getStagePosition$annotations()V
    .locals 0

    .line 1
    return-void
.end method

.method private static final initialize$lambda$2(Lcom/android/quickstep/views/DigitalWellBeingToast;)V
    .locals 12

    .line 1
    const/4 v1, 0x0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->launcherApps:Landroid/content/pm/LauncherApps;

    .line 3
    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    iget-object v2, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->task:Lcom/android/systemui/shared/recents/model/Task;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    .line 8
    const-string v3, "task"

    .line 9
    .line 10
    if-nez v2, :cond_0

    .line 11
    .line 12
    :try_start_1
    invoke-static {v3}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    move-object v2, v1

    .line 16
    goto :goto_0

    .line 17
    :catch_0
    move-exception v0

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    :goto_0
    invoke-virtual {v2}, Lcom/android/systemui/shared/recents/model/Task;->getTopComponent()Landroid/content/ComponentName;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    iget-object v4, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->task:Lcom/android/systemui/shared/recents/model/Task;

    .line 28
    .line 29
    if-nez v4, :cond_1

    .line 30
    .line 31
    invoke-static {v3}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    move-object v4, v1

    .line 35
    :cond_1
    iget-object v3, v4, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 36
    .line 37
    iget v3, v3, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->userId:I

    .line 38
    .line 39
    invoke-static {v3}, Landroid/os/UserHandle;->of(I)Landroid/os/UserHandle;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {v0, v2, v3}, Landroid/content/pm/LauncherApps;->getAppUsageLimit(Ljava/lang/String;Landroid/os/UserHandle;)Landroid/content/pm/LauncherApps$AppUsageLimit;

    .line 44
    .line 45
    .line 46
    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 47
    goto :goto_2

    .line 48
    :goto_1
    const-string v2, "DigitalWellBeingToast"

    .line 49
    .line 50
    const-string v3, "Error initializing digital well being toast"

    .line 51
    .line 52
    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 53
    .line 54
    .line 55
    :cond_2
    move-object v0, v1

    .line 56
    :goto_2
    const-wide/16 v2, -0x1

    .line 57
    .line 58
    if-eqz v0, :cond_3

    .line 59
    .line 60
    invoke-virtual {v0}, Landroid/content/pm/LauncherApps$AppUsageLimit;->getTotalUsageLimit()J

    .line 61
    .line 62
    .line 63
    move-result-wide v4

    .line 64
    move-wide v8, v4

    .line 65
    goto :goto_3

    .line 66
    :cond_3
    move-wide v8, v2

    .line 67
    :goto_3
    if-eqz v0, :cond_4

    .line 68
    .line 69
    invoke-virtual {v0}, Landroid/content/pm/LauncherApps$AppUsageLimit;->getUsageRemaining()J

    .line 70
    .line 71
    .line 72
    move-result-wide v2

    .line 73
    :cond_4
    move-wide v10, v2

    .line 74
    iget-object v0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 75
    .line 76
    if-nez v0, :cond_5

    .line 77
    .line 78
    const-string v0, "taskView"

    .line 79
    .line 80
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    goto :goto_4

    .line 84
    :cond_5
    move-object v1, v0

    .line 85
    :goto_4
    new-instance v6, Lcom/android/quickstep/views/h;

    .line 86
    .line 87
    move-object v7, p0

    .line 88
    invoke-direct/range {v6 .. v11}, Lcom/android/quickstep/views/h;-><init>(Lcom/android/quickstep/views/DigitalWellBeingToast;JJ)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v1, v6}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method private static final initialize$lambda$2$lambda$1(Lcom/android/quickstep/views/DigitalWellBeingToast;JJ)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->isDestroyed:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    cmp-long v2, p1, v0

    .line 9
    .line 10
    if-ltz v2, :cond_2

    .line 11
    .line 12
    cmp-long v0, p3, v0

    .line 13
    .line 14
    if-gez v0, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/quickstep/views/DigitalWellBeingToast;->setLimit(JJ)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_2
    :goto_0
    invoke-direct {p0}, Lcom/android/quickstep/views/DigitalWellBeingToast;->setNoLimit()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private final openAppUsageSettings(Landroid/view/View;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->task:Lcom/android/systemui/shared/recents/model/Task;

    .line 2
    .line 3
    const-string v1, "task"

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->task:Lcom/android/systemui/shared/recents/model/Task;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    move-object v0, v2

    .line 19
    :cond_1
    invoke-virtual {v0}, Lcom/android/systemui/shared/recents/model/Task;->getTopComponent()Landroid/content/ComponentName;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v3, "DigitalWellBeingToast"

    .line 24
    .line 25
    if-nez v0, :cond_3

    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->task:Lcom/android/systemui/shared/recents/model/Task;

    .line 28
    .line 29
    if-nez p0, :cond_2

    .line 30
    .line 31
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_2
    move-object v2, p0

    .line 36
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    .line 40
    .line 41
    const-string p1, "openAppUsageSettings: top component is null. task: "

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {v3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_3
    new-instance v0, Landroid/content/Intent;

    .line 58
    .line 59
    sget-object v4, Lcom/android/quickstep/views/DigitalWellBeingToast;->OPEN_APP_USAGE_SETTINGS_TEMPLATE:Landroid/content/Intent;

    .line 60
    .line 61
    invoke-direct {v0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 62
    .line 63
    .line 64
    iget-object v4, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->task:Lcom/android/systemui/shared/recents/model/Task;

    .line 65
    .line 66
    if-nez v4, :cond_4

    .line 67
    .line 68
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    move-object v4, v2

    .line 72
    :cond_4
    invoke-virtual {v4}, Lcom/android/systemui/shared/recents/model/Task;->getTopComponent()Landroid/content/ComponentName;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    invoke-virtual {v4}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    const-string v5, "android.intent.extra.PACKAGE_NAME"

    .line 81
    .line 82
    invoke-virtual {v0, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    const v4, 0x10008000

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    const-string v4, "addFlags(...)"

    .line 94
    .line 95
    invoke-static {v0, v4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    :try_start_0
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 103
    .line 104
    .line 105
    move-result v5

    .line 106
    const/4 v6, 0x0

    .line 107
    invoke-static {p1, v6, v6, v4, v5}, Landroid/app/ActivityOptions;->makeScaleUpAnimation(Landroid/view/View;IIII)Landroid/app/ActivityOptions;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 112
    .line 113
    .line 114
    move-result-object v4

    .line 115
    invoke-virtual {p1}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {v4, v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :catch_0
    move-exception p1

    .line 124
    iget-object p0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->task:Lcom/android/systemui/shared/recents/model/Task;

    .line 125
    .line 126
    if-nez p0, :cond_5

    .line 127
    .line 128
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    goto :goto_1

    .line 132
    :cond_5
    move-object v2, p0

    .line 133
    :goto_1
    invoke-virtual {v2}, Lcom/android/systemui/shared/recents/model/Task;->getTopComponent()Landroid/content/ComponentName;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-virtual {p0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    new-instance v0, Ljava/lang/StringBuilder;

    .line 142
    .line 143
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 144
    .line 145
    .line 146
    const-string v1, "Failed to open app usage settings for task "

    .line 147
    .line 148
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-static {v3, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 159
    .line 160
    .line 161
    return-void
.end method

.method private final setContentDescription(JJ)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->task:Lcom/android/systemui/shared/recents/model/Task;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const-string v0, "task"

    .line 7
    .line 8
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v3, v1

    .line 12
    :goto_0
    move-object v2, p0

    .line 13
    move-wide v4, p1

    .line 14
    move-wide v6, p3

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    move-object v3, v0

    .line 17
    goto :goto_0

    .line 18
    :goto_1
    invoke-direct/range {v2 .. v7}, Lcom/android/quickstep/views/DigitalWellBeingToast;->getContentDescriptionForTask(Lcom/android/systemui/shared/recents/model/Task;JJ)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    iget-object p1, v2, Lcom/android/quickstep/views/DigitalWellBeingToast;->snapshotView:Landroid/view/View;

    .line 23
    .line 24
    if-nez p1, :cond_1

    .line 25
    .line 26
    const-string p1, "snapshotView"

    .line 27
    .line 28
    invoke-static {p1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    goto :goto_2

    .line 32
    :cond_1
    move-object v1, p1

    .line 33
    :goto_2
    invoke-virtual {v1, p0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private final setLimit(JJ)V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->hasLimit:Z

    .line 7
    .line 8
    iput-wide p3, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->appRemainingTimeMs:J

    .line 9
    .line 10
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/quickstep/views/DigitalWellBeingToast;->setContentDescription(JJ)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const/4 v4, 0x3

    .line 18
    const/4 v5, 0x0

    .line 19
    const-wide/16 v1, 0x0

    .line 20
    .line 21
    const/4 v3, 0x0

    .line 22
    move-object v0, p0

    .line 23
    invoke-static/range {v0 .. v5}, Lcom/android/quickstep/views/DigitalWellBeingToast;->getBannerText$default(Lcom/android/quickstep/views/DigitalWellBeingToast;JZILjava/lang/Object;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const p2, 0x7f080d31

    .line 28
    .line 29
    .line 30
    invoke-static {p1, p2, p0}, Lcom/android/launcher3/N5;->S(Landroid/content/Context;ILjava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method private final setNoLimit()V
    .locals 2

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->hasLimit:Z

    .line 8
    .line 9
    const-wide/16 v0, -0x1

    .line 10
    .line 11
    iput-wide v0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->appRemainingTimeMs:J

    .line 12
    .line 13
    invoke-direct {p0, v0, v1, v0, v1}, Lcom/android/quickstep/views/DigitalWellBeingToast;->setContentDescription(JJ)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private final setSplitOffsetTranslationY(F)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->splitOffsetTranslationY:F

    .line 2
    .line 3
    cmpg-float v0, v0, p1

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput p1, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->splitOffsetTranslationY:F

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/quickstep/views/DigitalWellBeingToast;->updateTranslationY()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private final setupTranslations()V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 2
    .line 3
    const-string v1, "taskView"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    move-object v0, v2

    .line 12
    :cond_0
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    iget-object v0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 17
    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    move-object v0, v2

    .line 24
    :cond_1
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget v4, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 31
    .line 32
    if-nez v0, :cond_2

    .line 33
    .line 34
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    move-object v0, v2

    .line 38
    :cond_2
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget v5, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 43
    .line 44
    iget-object v6, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->splitBounds:Lcom/android/launcher3/util/y2$a;

    .line 45
    .line 46
    iget-object v0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 47
    .line 48
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 49
    .line 50
    .line 51
    move-result-object v7

    .line 52
    const-string v0, "getDeviceProfile(...)"

    .line 53
    .line 54
    invoke-static {v7, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 58
    .line 59
    if-nez v0, :cond_3

    .line 60
    .line 61
    invoke-static {v1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    move-object v0, v2

    .line 65
    :cond_3
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getSnapshotViews()[Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v8

    .line 69
    iget-object v0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->task:Lcom/android/systemui/shared/recents/model/Task;

    .line 70
    .line 71
    if-nez v0, :cond_4

    .line 72
    .line 73
    const-string v0, "task"

    .line 74
    .line 75
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_4
    move-object v2, v0

    .line 80
    :goto_0
    iget-object v0, v2, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 81
    .line 82
    iget v9, v0, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 83
    .line 84
    move-object v10, p0

    .line 85
    invoke-interface/range {v3 .. v10}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getDwbBannerTranslations(IILcom/android/launcher3/util/y2$a;Lcom/android/launcher3/h0;[Landroid/view/View;ILandroid/view/View;)Landroid/util/Pair;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    iget-object v0, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 90
    .line 91
    check-cast v0, Ljava/lang/Number;

    .line 92
    .line 93
    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 98
    .line 99
    check-cast p0, Ljava/lang/Number;

    .line 100
    .line 101
    invoke-virtual {p0}, Ljava/lang/Number;->floatValue()F

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setTranslationX(F)V

    .line 106
    .line 107
    .line 108
    invoke-direct {v10, p0}, Lcom/android/quickstep/views/DigitalWellBeingToast;->setSplitOffsetTranslationY(F)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method private final updateTranslationY()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->bannerOffsetPercentage:F

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->bannerHeight:I

    .line 4
    .line 5
    int-to-float v1, v1

    .line 6
    mul-float/2addr v0, v1

    .line 7
    iget v1, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->splitOffsetTranslationY:F

    .line 8
    .line 9
    add-float/2addr v0, v1

    .line 10
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTranslationY(F)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/TextView;->invalidateOutline()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final bind(Lcom/android/systemui/shared/recents/model/Task;Lcom/android/quickstep/views/TaskView;Landroid/view/View;I)V
    .locals 1

    .line 1
    const-string v0, "task"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "taskView"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "snapshotView"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->task:Lcom/android/systemui/shared/recents/model/Task;

    .line 17
    .line 18
    iput-object p2, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 19
    .line 20
    iput-object p3, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->snapshotView:Landroid/view/View;

    .line 21
    .line 22
    iput p4, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->stagePosition:I

    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    iput-boolean p1, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->isDestroyed:Z

    .line 26
    .line 27
    return-void
.end method

.method public final destroy()V
    .locals 1

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->isDestroyed:Z

    .line 8
    .line 9
    return-void
.end method

.method public final getBannerOffsetPercentage()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->bannerOffsetPercentage:F

    .line 2
    .line 3
    return p0
.end method

.method public final getBannerText()Ljava/lang/String;
    .locals 6

    .line 1
    const/4 v4, 0x3

    const/4 v5, 0x0

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lcom/android/quickstep/views/DigitalWellBeingToast;->getBannerText$default(Lcom/android/quickstep/views/DigitalWellBeingToast;JZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getBannerText(J)Ljava/lang/String;
    .locals 6

    .line 2
    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-wide v1, p1

    invoke-static/range {v0 .. v5}, Lcom/android/quickstep/views/DigitalWellBeingToast;->getBannerText$default(Lcom/android/quickstep/views/DigitalWellBeingToast;JZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getBannerText(JZ)Ljava/lang/String;
    .locals 4

    const-wide/32 v0, 0xea60

    cmp-long v0, p1, v0

    if-lez v0, :cond_0

    const v0, 0xea60

    int-to-long v0, v0

    add-long/2addr p1, v0

    const-wide/16 v2, 0x1

    sub-long/2addr p1, v2

    .line 3
    div-long/2addr p1, v0

    mul-long/2addr p1, v0

    .line 4
    :cond_0
    invoke-static {p1, p2}, Ljava/time/Duration;->ofMillis(J)Ljava/time/Duration;

    move-result-object p1

    .line 5
    invoke-static {p1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    const p2, 0x7f1403d7

    .line 6
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/views/DigitalWellBeingToast;->getReadableDuration(Ljava/time/Duration;I)Ljava/lang/String;

    move-result-object p1

    .line 7
    invoke-direct {p0}, Lcom/android/quickstep/views/DigitalWellBeingToast;->getSplitBannerConfig()Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;

    move-result-object p2

    if-nez p3, :cond_3

    .line 8
    sget-object p3, Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;->SPLIT_BANNER_FULLSCREEN:Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;

    if-ne p2, p3, :cond_1

    goto :goto_0

    .line 9
    :cond_1
    sget-object p0, Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;->SPLIT_GRID_BANNER_SMALL:Lcom/android/quickstep/views/DigitalWellBeingToast$Companion$SplitBannerConfig;

    if-ne p2, p0, :cond_2

    const-string p0, ""

    return-object p0

    :cond_2
    return-object p1

    .line 10
    :cond_3
    :goto_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object p0

    const p2, 0x7f140440

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, p2, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "getString(...)"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public final getDWBAccessibilityAction()Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->hasLimit:Z

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
    iget-object v0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    const-string v0, "taskView"

    .line 12
    .line 13
    invoke-static {v0}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    move-object v0, v1

    .line 17
    :cond_1
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->containsMultipleTasks()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_3

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iget-object v3, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->task:Lcom/android/systemui/shared/recents/model/Task;

    .line 32
    .line 33
    if-nez v3, :cond_2

    .line 34
    .line 35
    const-string v3, "task"

    .line 36
    .line 37
    invoke-static {v3}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    move-object v1, v3

    .line 42
    :goto_0
    invoke-static {v2, v1}, Lcom/android/quickstep/TaskUtils;->getTitle(Landroid/content/Context;Lcom/android/systemui/shared/recents/model/Task;)Ljava/lang/CharSequence;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    const v2, 0x7f140407

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v2, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    goto :goto_1

    .line 58
    :cond_3
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    const v1, 0x7f140031

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    :goto_1
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    new-instance v1, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    .line 73
    .line 74
    invoke-direct {p0}, Lcom/android/quickstep/views/DigitalWellBeingToast;->getAccessibilityActionId()I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    invoke-direct {v1, p0, v0}, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;-><init>(ILjava/lang/CharSequence;)V

    .line 79
    .line 80
    .line 81
    return-object v1
.end method

.method public final getHasLimit()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->hasLimit:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getSplitBounds()Lcom/android/launcher3/util/y2$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->splitBounds:Lcom/android/launcher3/util/y2$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public final handleAccessibilityAction(I)Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/views/DigitalWellBeingToast;->getAccessibilityActionId()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eq v0, p1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget-object p1, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 10
    .line 11
    if-nez p1, :cond_1

    .line 12
    .line 13
    const-string p1, "taskView"

    .line 14
    .line 15
    invoke-static {p1}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/quickstep/views/DigitalWellBeingToast;->openAppUsageSettings(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0
.end method

.method public final initialize()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->isDestroyed:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/quickstep/views/DigitalWellBeingToast;->setupTranslations()V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/android/launcher3/util/m0;->d:Lcom/android/launcher3/util/p1;

    .line 9
    .line 10
    new-instance v1, Lcom/android/quickstep/views/f;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Lcom/android/quickstep/views/f;-><init>(Lcom/android/quickstep/views/DigitalWellBeingToast;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 20
    .line 21
    const-string v0, "Cannot re-initialize a destroyed toast"

    .line 22
    .line 23
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    throw p0
.end method

.method public final setBannerOffsetPercentage(F)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->bannerOffsetPercentage:F

    .line 2
    .line 3
    cmpg-float v0, v0, p1

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput p1, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->bannerOffsetPercentage:F

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/quickstep/views/DigitalWellBeingToast;->updateTranslationY()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final setColorTint(IF)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v0, p2, v0

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Landroid/widget/TextView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    new-instance v0, Landroid/graphics/Paint;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {p1, p2}, Lcom/android/launcher3/N5;->I(IF)Landroid/graphics/ColorFilter;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 21
    .line 22
    .line 23
    const/4 p1, 0x2

    .line 24
    invoke-virtual {p0, p1, v0}, Landroid/widget/TextView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setLayerPaint(Landroid/graphics/Paint;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final setHasLimit(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->hasLimit:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setSplitBounds(Lcom/android/launcher3/util/y2$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->splitBounds:Lcom/android/launcher3/util/y2$a;

    .line 2
    .line 3
    return-void
.end method

.method public final setupLayout()V
    .locals 10

    .line 1
    iget-object v2, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->splitBounds:Lcom/android/launcher3/util/y2$a;

    .line 2
    .line 3
    const-string v6, "getDeviceProfile(...)"

    .line 4
    .line 5
    const/4 v8, 0x0

    .line 6
    const-string v9, "taskView"

    .line 7
    .line 8
    if-nez v2, :cond_2

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    invoke-static {v9}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    move-object v0, v8

    .line 18
    :cond_0
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 23
    .line 24
    iget-object v1, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 25
    .line 26
    if-nez v1, :cond_1

    .line 27
    .line 28
    invoke-static {v9}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    move-object v1, v8

    .line 32
    :cond_1
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 37
    .line 38
    iget-object v2, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 39
    .line 40
    invoke-interface {v2}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    iget v2, v2, Lcom/android/launcher3/h0;->S2:I

    .line 45
    .line 46
    sub-int/2addr v1, v2

    .line 47
    move v5, v0

    .line 48
    goto/16 :goto_1

    .line 49
    .line 50
    :cond_2
    iget-object v0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 51
    .line 52
    invoke-interface {v0}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget v0, v0, Lcom/android/launcher3/h0;->S2:I

    .line 57
    .line 58
    iget-object v1, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 59
    .line 60
    if-nez v1, :cond_3

    .line 61
    .line 62
    invoke-static {v9}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    move-object v1, v8

    .line 66
    :cond_3
    invoke-virtual {v1}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    if-eqz v1, :cond_5

    .line 71
    .line 72
    iget-object v0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 73
    .line 74
    if-nez v0, :cond_4

    .line 75
    .line 76
    invoke-static {v9}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    move-object v0, v8

    .line 80
    :cond_4
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getRecentsView()Lcom/android/quickstep/views/RecentsView;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-static {v0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    iget-object v1, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 88
    .line 89
    invoke-interface {v1}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v0, v1}, Lcom/android/quickstep/views/RecentsView;->getThumbnailTopMargin(Lcom/android/launcher3/h0;)I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    :cond_5
    move v5, v0

    .line 98
    iget-object v0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 99
    .line 100
    if-nez v0, :cond_6

    .line 101
    .line 102
    invoke-static {v9}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    move-object v0, v8

    .line 106
    :cond_6
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iget-object v1, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 111
    .line 112
    invoke-interface {v1}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-static {v1, v6}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    iget-object v3, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 120
    .line 121
    if-nez v3, :cond_7

    .line 122
    .line 123
    invoke-static {v9}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    move-object v3, v8

    .line 127
    :cond_7
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    iget v3, v3, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 132
    .line 133
    iget-object v4, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 134
    .line 135
    if-nez v4, :cond_8

    .line 136
    .line 137
    invoke-static {v9}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    move-object v4, v8

    .line 141
    :cond_8
    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 142
    .line 143
    .line 144
    move-result-object v4

    .line 145
    iget v4, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 146
    .line 147
    invoke-interface/range {v0 .. v5}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->getGroupedTaskViewSizes(Lcom/android/launcher3/h0;Lcom/android/launcher3/util/y2$a;III)Landroid/util/Pair;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    iget v1, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->stagePosition:I

    .line 152
    .line 153
    if-nez v1, :cond_9

    .line 154
    .line 155
    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 156
    .line 157
    move-object v1, v0

    .line 158
    check-cast v1, Landroid/graphics/Point;

    .line 159
    .line 160
    iget v1, v1, Landroid/graphics/Point;->x:I

    .line 161
    .line 162
    check-cast v0, Landroid/graphics/Point;

    .line 163
    .line 164
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 165
    .line 166
    :goto_0
    move v5, v1

    .line 167
    move v1, v0

    .line 168
    goto :goto_1

    .line 169
    :cond_9
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 170
    .line 171
    move-object v1, v0

    .line 172
    check-cast v1, Landroid/graphics/Point;

    .line 173
    .line 174
    iget v1, v1, Landroid/graphics/Point;->x:I

    .line 175
    .line 176
    check-cast v0, Landroid/graphics/Point;

    .line 177
    .line 178
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 179
    .line 180
    goto :goto_0

    .line 181
    :goto_1
    iget-object v0, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 182
    .line 183
    if-nez v0, :cond_a

    .line 184
    .line 185
    invoke-static {v9}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    move-object v0, v8

    .line 189
    :cond_a
    invoke-virtual {v0}, Lcom/android/quickstep/views/TaskView;->getPagedOrientationHandler()Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    iget-object v2, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 194
    .line 195
    if-nez v2, :cond_b

    .line 196
    .line 197
    invoke-static {v9}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    move-object v2, v8

    .line 201
    :cond_b
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 202
    .line 203
    .line 204
    move-result-object v2

    .line 205
    iget v2, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 206
    .line 207
    iget-object v3, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 208
    .line 209
    if-nez v3, :cond_c

    .line 210
    .line 211
    invoke-static {v9}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    move-object v3, v8

    .line 215
    :cond_c
    invoke-virtual {v3}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 216
    .line 217
    .line 218
    move-result-object v3

    .line 219
    iget v3, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 220
    .line 221
    iget-object v4, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->taskView:Lcom/android/quickstep/views/TaskView;

    .line 222
    .line 223
    if-nez v4, :cond_d

    .line 224
    .line 225
    invoke-static {v9}, Lkotlin/jvm/internal/o;->u(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    goto :goto_2

    .line 229
    :cond_d
    move-object v8, v4

    .line 230
    :goto_2
    instance-of v4, v8, Lcom/android/quickstep/views/GroupedTaskView;

    .line 231
    .line 232
    iget-object v8, p0, Lcom/android/quickstep/views/DigitalWellBeingToast;->recentsViewContainer:Lcom/android/quickstep/views/RecentsViewContainer;

    .line 233
    .line 234
    invoke-interface {v8}, Lcom/android/quickstep/views/RecentsViewContainer;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 235
    .line 236
    .line 237
    move-result-object v8

    .line 238
    invoke-static {v8, v6}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    move-object v7, p0

    .line 242
    move v6, v1

    .line 243
    move v1, v2

    .line 244
    move v2, v3

    .line 245
    move v3, v4

    .line 246
    move-object v4, v8

    .line 247
    invoke-interface/range {v0 .. v7}, Lcom/android/quickstep/orientation/RecentsPagedOrientationHandler;->updateDwbBannerLayout(IIZLcom/android/launcher3/h0;IILandroid/view/View;)V

    .line 248
    .line 249
    .line 250
    return-void
.end method
