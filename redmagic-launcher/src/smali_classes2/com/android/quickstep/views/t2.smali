.class public final synthetic Lcom/android/quickstep/views/t2;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/views/TaskView;

.field public final synthetic h:Lcom/android/quickstep/views/TaskViewIcon;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskViewIcon;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/views/t2;->g:Lcom/android/quickstep/views/TaskView;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/views/t2;->h:Lcom/android/quickstep/views/TaskViewIcon;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/views/t2;->g:Lcom/android/quickstep/views/TaskView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/views/t2;->h:Lcom/android/quickstep/views/TaskViewIcon;

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Lcom/android/quickstep/views/TaskView;->c(Lcom/android/quickstep/views/TaskView;Lcom/android/quickstep/views/TaskViewIcon;Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
