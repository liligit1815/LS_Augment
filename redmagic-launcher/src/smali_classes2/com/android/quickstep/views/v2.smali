.class public final synthetic Lcom/android/quickstep/views/v2;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:I

.field public final synthetic h:Lcom/android/quickstep/views/TaskView;

.field public final synthetic i:Lcom/android/quickstep/views/TaskView;


# direct methods
.method public synthetic constructor <init>(ILcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/android/quickstep/views/v2;->g:I

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/views/v2;->h:Lcom/android/quickstep/views/TaskView;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/views/v2;->i:Lcom/android/quickstep/views/TaskView;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/quickstep/views/v2;->g:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/views/v2;->h:Lcom/android/quickstep/views/TaskView;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/quickstep/views/v2;->i:Lcom/android/quickstep/views/TaskView;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lcom/android/quickstep/views/TaskView;->d(ILcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskView;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
