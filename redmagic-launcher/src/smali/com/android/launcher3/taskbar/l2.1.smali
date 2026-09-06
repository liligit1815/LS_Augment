.class public final synthetic Lcom/android/launcher3/taskbar/l2;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnComputeInternalInsetsListener;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/taskbar/TaskbarDragLayer;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/taskbar/TaskbarDragLayer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/l2;->g:Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onComputeInternalInsets(Landroid/view/ViewTreeObserver$InternalInsetsInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/l2;->g:Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/android/launcher3/taskbar/TaskbarDragLayer;->c(Lcom/android/launcher3/taskbar/TaskbarDragLayer;Landroid/view/ViewTreeObserver$InternalInsetsInfo;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
