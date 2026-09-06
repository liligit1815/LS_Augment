.class Lcom/android/launcher3/q5$l;
.super Landroid/view/IRemoteAnimationFinishedCallback$Stub;
.source "QuickstepTransitionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/q5;->U([Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;[Landroid/view/RemoteAnimationTarget;Landroid/graphics/RectF;FZ)Lcom/android/quickstep/util/BackAnimState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/util/Y1;


# direct methods
.method constructor <init>(Lcom/android/launcher3/q5;Lcom/android/launcher3/util/Y1;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/launcher3/q5$l;->g:Lcom/android/launcher3/util/Y1;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/IRemoteAnimationFinishedCallback$Stub;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationFinished()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/q5$l;->g:Lcom/android/launcher3/util/Y1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/util/Y1;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
