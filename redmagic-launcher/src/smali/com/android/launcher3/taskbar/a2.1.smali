.class public final synthetic Lcom/android/launcher3/taskbar/a2;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnDragListener;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/taskbar/j2;

.field public final synthetic h:Lcom/android/launcher3/BubbleTextView;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/taskbar/j2;Lcom/android/launcher3/BubbleTextView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/a2;->g:Lcom/android/launcher3/taskbar/j2;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/taskbar/a2;->h:Lcom/android/launcher3/BubbleTextView;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onDrag(Landroid/view/View;Landroid/view/DragEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/a2;->g:Lcom/android/launcher3/taskbar/j2;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/a2;->h:Lcom/android/launcher3/BubbleTextView;

    .line 4
    .line 5
    invoke-static {v0, p0, p1, p2}, Lcom/android/launcher3/taskbar/j2;->T(Lcom/android/launcher3/taskbar/j2;Lcom/android/launcher3/BubbleTextView;Landroid/view/View;Landroid/view/DragEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
