.class Lcom/android/quickstep/views/SplitInstructionsView$1;
.super Landroid/util/FloatProperty;
.source "SplitInstructionsView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/views/SplitInstructionsView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/FloatProperty<",
        "Lcom/android/quickstep/views/SplitInstructionsView;",
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
.method public get(Lcom/android/quickstep/views/SplitInstructionsView;)Ljava/lang/Float;
    .locals 0

    .line 2
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getScaleY()F

    move-result p0

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/android/quickstep/views/SplitInstructionsView;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/SplitInstructionsView$1;->get(Lcom/android/quickstep/views/SplitInstructionsView;)Ljava/lang/Float;

    move-result-object p0

    return-object p0
.end method

.method public setValue(Lcom/android/quickstep/views/SplitInstructionsView;F)V
    .locals 0

    .line 2
    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->setScaleY(F)V

    return-void
.end method

.method public bridge synthetic setValue(Ljava/lang/Object;F)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/quickstep/views/SplitInstructionsView;

    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/views/SplitInstructionsView$1;->setValue(Lcom/android/quickstep/views/SplitInstructionsView;F)V

    return-void
.end method
