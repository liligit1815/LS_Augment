.class public final synthetic Lcom/android/quickstep/views/l2;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/views/TaskContainer;

.field public final synthetic h:Landroid/app/ActivityOptions;

.field public final synthetic i:Lcom/android/quickstep/views/TaskView;

.field public final synthetic j:Lu4/l;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/views/TaskContainer;Landroid/app/ActivityOptions;Lcom/android/quickstep/views/TaskView;Lu4/l;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/views/l2;->g:Lcom/android/quickstep/views/TaskContainer;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/views/l2;->h:Landroid/app/ActivityOptions;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/views/l2;->i:Lcom/android/quickstep/views/TaskView;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/quickstep/views/l2;->j:Lu4/l;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/l2;->g:Lcom/android/quickstep/views/TaskContainer;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/views/l2;->h:Landroid/app/ActivityOptions;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/views/l2;->i:Lcom/android/quickstep/views/TaskView;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/views/l2;->j:Lu4/l;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Lcom/android/quickstep/views/TaskView;->q(Lcom/android/quickstep/views/TaskContainer;Landroid/app/ActivityOptions;Lcom/android/quickstep/views/TaskView;Lu4/l;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
