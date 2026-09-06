.class Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp$2;
.super Landroid/util/FloatProperty;
.source "SpringAnimationImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/FloatProperty<",
        "LP1/h;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/util/FloatProperty;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public get(LP1/h;)Ljava/lang/Float;
    .locals 0

    .line 2
    const-string p0, "depthController"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p0, 0x0

    .line 3
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, LP1/h;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp$2;->get(LP1/h;)Ljava/lang/Float;

    move-result-object p0

    return-object p0
.end method

.method public setValue(LP1/h;F)V
    .locals 0

    .line 2
    const-string p0, "depthController"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public bridge synthetic setValue(Ljava/lang/Object;F)V
    .locals 0

    .line 1
    check-cast p1, LP1/h;

    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/util/animation/SpringAnimationImpl$DepthSpringAnimImp$2;->setValue(LP1/h;F)V

    return-void
.end method
