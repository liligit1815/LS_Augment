.class public final Lcom/android/quickstep/util/LottieAnimationColorUtils;
.super Ljava/lang/Object;
.source "LottieAnimationColorUtils.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ljava/lang/Integer;LI0/b;)Landroid/graphics/ColorFilter;
    .locals 1

    .line 1
    new-instance p1, Landroid/graphics/PorterDuffColorFilter;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 8
    .line 9
    invoke-direct {p1, p0, v0}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    .line 10
    .line 11
    .line 12
    return-object p1
.end method

.method public static synthetic b(Ljava/util/Map;Lcom/airbnb/lottie/LottieAnimationView;Lv0/h;)V
    .locals 0

    .line 1
    new-instance p2, Lcom/android/quickstep/util/t0;

    .line 2
    .line 3
    invoke-direct {p2, p1}, Lcom/android/quickstep/util/t0;-><init>(Lcom/airbnb/lottie/LottieAnimationView;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0, p2}, Ljava/util/Map;->forEach(Ljava/util/function/BiConsumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic c(Lcom/airbnb/lottie/LottieAnimationView;Ljava/util/Map;Landroid/content/res/Resources$Theme;Ljava/lang/String;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p1, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-virtual {p0, p1, p2}, Landroid/content/res/Resources;->getColor(ILandroid/content/res/Resources$Theme;)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic d(Lcom/airbnb/lottie/LottieAnimationView;Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 2

    .line 1
    new-instance v0, LA0/e;

    .line 2
    .line 3
    const-string v1, "**"

    .line 4
    .line 5
    filled-new-array {v1, p1, v1}, [Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-direct {v0, p1}, LA0/e;-><init>([Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sget-object p1, Lv0/u;->K:Landroid/graphics/ColorFilter;

    .line 13
    .line 14
    new-instance v1, Lcom/android/quickstep/util/q0;

    .line 15
    .line 16
    invoke-direct {v1, p2}, Lcom/android/quickstep/util/q0;-><init>(Ljava/lang/Integer;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0, p1, v1}, Lcom/airbnb/lottie/LottieAnimationView;->l(LA0/e;Ljava/lang/Object;LI0/e;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static updateToArgbColors(Lcom/airbnb/lottie/LottieAnimationView;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/airbnb/lottie/LottieAnimationView;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/quickstep/util/s0;

    .line 2
    .line 3
    invoke-direct {v0, p1, p0}, Lcom/android/quickstep/util/s0;-><init>(Ljava/util/Map;Lcom/airbnb/lottie/LottieAnimationView;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/airbnb/lottie/LottieAnimationView;->j(Lv0/t;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static updateToColorResources(Lcom/airbnb/lottie/LottieAnimationView;Ljava/util/Map;Landroid/content/res/Resources$Theme;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/airbnb/lottie/LottieAnimationView;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;",
            "Landroid/content/res/Resources$Theme;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/Set;->stream()Ljava/util/stream/Stream;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Ljava/util/function/Function;->identity()Ljava/util/function/Function;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Lcom/android/quickstep/util/r0;

    .line 14
    .line 15
    invoke-direct {v2, p0, p1, p2}, Lcom/android/quickstep/util/r0;-><init>(Lcom/airbnb/lottie/LottieAnimationView;Ljava/util/Map;Landroid/content/res/Resources$Theme;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1, v2}, Ljava/util/stream/Collectors;->toMap(Ljava/util/function/Function;Ljava/util/function/Function;)Ljava/util/stream/Collector;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-interface {v0, p1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Ljava/util/Map;

    .line 27
    .line 28
    invoke-static {p0, p1}, Lcom/android/quickstep/util/LottieAnimationColorUtils;->updateToArgbColors(Lcom/airbnb/lottie/LottieAnimationView;Ljava/util/Map;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
