.class public final synthetic Lcom/android/quickstep/utils/e;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/utils/e;->g:Ljava/lang/Runnable;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/utils/e;->g:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/quickstep/utils/AnimationController;->e(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
