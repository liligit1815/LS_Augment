.class public final synthetic Lcom/android/quickstep/a3;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Z


# direct methods
.method public synthetic constructor <init>(Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lcom/android/quickstep/a3;->g:Z

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/a3;->g:Z

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/quickstep/RecentsAnimationController;->h(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
