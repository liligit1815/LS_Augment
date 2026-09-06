.class Lcom/android/quickstep/utils/MFVAnimManager$4;
.super Lcom/android/quickstep/util/anim/ObjectProperty;
.source "MFVAnimManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/utils/MFVAnimManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/quickstep/util/anim/ObjectProperty<",
        "Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/anim/ObjectProperty;-><init>(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public afterChange(Lcom/android/quickstep/util/anim/ObjectAnnotationProperty;Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/util/anim/ObjectAnnotationProperty<",
            "*>;",
            "Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;",
            "Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;",
            ")V"
        }
    .end annotation

    .line 2
    const-string p0, "property"

    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public bridge synthetic afterChange(Lcom/android/quickstep/util/anim/ObjectAnnotationProperty;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p2, Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;

    check-cast p3, Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;

    invoke-virtual {p0, p1, p2, p3}, Lcom/android/quickstep/utils/MFVAnimManager$4;->afterChange(Lcom/android/quickstep/util/anim/ObjectAnnotationProperty;Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;Lcom/android/quickstep/utils/DefaultAnimationSeqHelper;)V

    return-void
.end method
