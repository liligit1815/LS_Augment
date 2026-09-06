.class public final synthetic Lcom/android/quickstep/Y4;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/TaskAnimationManager$2;

.field public final synthetic h:Lcom/android/quickstep/GestureState;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/TaskAnimationManager$2;Lcom/android/quickstep/GestureState;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/Y4;->g:Lcom/android/quickstep/TaskAnimationManager$2;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/Y4;->h:Lcom/android/quickstep/GestureState;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/Y4;->g:Lcom/android/quickstep/TaskAnimationManager$2;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/Y4;->h:Lcom/android/quickstep/GestureState;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lcom/android/quickstep/TaskAnimationManager$2;->a(Lcom/android/quickstep/TaskAnimationManager$2;Lcom/android/quickstep/GestureState;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
