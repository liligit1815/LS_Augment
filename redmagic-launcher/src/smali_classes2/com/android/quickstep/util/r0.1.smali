.class public final synthetic Lcom/android/quickstep/util/r0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Function;


# instance fields
.field public final synthetic a:Lcom/airbnb/lottie/LottieAnimationView;

.field public final synthetic b:Ljava/util/Map;

.field public final synthetic c:Landroid/content/res/Resources$Theme;


# direct methods
.method public synthetic constructor <init>(Lcom/airbnb/lottie/LottieAnimationView;Ljava/util/Map;Landroid/content/res/Resources$Theme;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/r0;->a:Lcom/airbnb/lottie/LottieAnimationView;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/util/r0;->b:Ljava/util/Map;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/util/r0;->c:Landroid/content/res/Resources$Theme;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/r0;->a:Lcom/airbnb/lottie/LottieAnimationView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/r0;->b:Ljava/util/Map;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/util/r0;->c:Landroid/content/res/Resources$Theme;

    .line 6
    .line 7
    check-cast p1, Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0, v1, p0, p1}, Lcom/android/quickstep/util/LottieAnimationColorUtils;->c(Lcom/airbnb/lottie/LottieAnimationView;Ljava/util/Map;Landroid/content/res/Resources$Theme;Ljava/lang/String;)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
