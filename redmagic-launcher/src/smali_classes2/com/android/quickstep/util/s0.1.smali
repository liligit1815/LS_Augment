.class public final synthetic Lcom/android/quickstep/util/s0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lv0/t;


# instance fields
.field public final synthetic a:Ljava/util/Map;

.field public final synthetic b:Lcom/airbnb/lottie/LottieAnimationView;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Map;Lcom/airbnb/lottie/LottieAnimationView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/s0;->a:Ljava/util/Map;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/util/s0;->b:Lcom/airbnb/lottie/LottieAnimationView;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Lv0/h;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/s0;->a:Ljava/util/Map;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/util/s0;->b:Lcom/airbnb/lottie/LottieAnimationView;

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Lcom/android/quickstep/util/LottieAnimationColorUtils;->b(Ljava/util/Map;Lcom/airbnb/lottie/LottieAnimationView;Lv0/h;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
