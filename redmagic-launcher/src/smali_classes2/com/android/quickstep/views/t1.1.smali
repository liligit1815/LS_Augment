.class public final synthetic Lcom/android/quickstep/views/t1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/views/RecentsView;

.field public final synthetic h:Lcom/android/quickstep/views/TaskContainer;

.field public final synthetic i:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskContainer;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/views/t1;->g:Lcom/android/quickstep/views/RecentsView;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/views/t1;->h:Lcom/android/quickstep/views/TaskContainer;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/views/t1;->i:Ljava/lang/Runnable;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/t1;->g:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/views/t1;->h:Lcom/android/quickstep/views/TaskContainer;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/views/t1;->i:Ljava/lang/Runnable;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/quickstep/views/RecentsView;->s0(Lcom/android/quickstep/views/RecentsView;Lcom/android/quickstep/views/TaskContainer;Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
