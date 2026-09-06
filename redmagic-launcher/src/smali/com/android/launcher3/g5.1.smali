.class public final synthetic Lcom/android/launcher3/g5;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/anim/C;

.field public final synthetic h:Landroid/animation/AnimatorSet;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/anim/C;Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/g5;->g:Lcom/android/launcher3/anim/C;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/g5;->h:Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/g5;->g:Lcom/android/launcher3/anim/C;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/g5;->h:Landroid/animation/AnimatorSet;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/android/launcher3/q5;->g(Lcom/android/launcher3/anim/C;Landroid/animation/AnimatorSet;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
