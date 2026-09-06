.class public final synthetic Lcom/android/quickstep/util/animation/a;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;

.field public final synthetic h:Landroid/animation/Animator;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/animation/a;->g:Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/util/animation/a;->h:Landroid/animation/Animator;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/animation/a;->g:Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/util/animation/a;->h:Landroid/animation/Animator;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;->d(Lcom/android/quickstep/util/animation/AsyncAnimCallbacks;Landroid/animation/Animator;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
