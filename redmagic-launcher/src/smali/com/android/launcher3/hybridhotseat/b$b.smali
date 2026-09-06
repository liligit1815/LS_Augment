.class Lcom/android/launcher3/hybridhotseat/b$b;
.super Lcom/android/launcher3/anim/g;
.source "HotseatPredictionController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/hybridhotseat/b;->K(Ljava/util/List;Lcom/android/launcher3/n0$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/uioverrides/PredictedAppIcon;

.field final synthetic h:Lcom/android/launcher3/hybridhotseat/b;


# direct methods
.method constructor <init>(Lcom/android/launcher3/hybridhotseat/b;Lcom/android/launcher3/uioverrides/PredictedAppIcon;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/hybridhotseat/b$b;->h:Lcom/android/launcher3/hybridhotseat/b;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/hybridhotseat/b$b;->g:Lcom/android/launcher3/uioverrides/PredictedAppIcon;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/anim/g;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationSuccess(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/hybridhotseat/b$b;->g:Lcom/android/launcher3/uioverrides/PredictedAppIcon;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/launcher3/hybridhotseat/b$b;->h:Lcom/android/launcher3/hybridhotseat/b;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/hybridhotseat/b$b;->g:Lcom/android/launcher3/uioverrides/PredictedAppIcon;

    .line 12
    .line 13
    invoke-static {p1, p0}, Lcom/android/launcher3/hybridhotseat/b;->k(Lcom/android/launcher3/hybridhotseat/b;Lcom/android/launcher3/uioverrides/PredictedAppIcon;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method
