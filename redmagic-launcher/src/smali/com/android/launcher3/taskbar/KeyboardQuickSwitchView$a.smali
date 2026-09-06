.class Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$a;
.super Ljava/lang/Object;
.source "KeyboardQuickSwitchView.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->J(Landroid/content/Context;Ljava/util/List;IZILcom/android/launcher3/taskbar/L$b;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:I

.field final synthetic h:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$a;->h:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$a;->g:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$a;->h:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->z(Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$a;->h:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 7
    .line 8
    iget v1, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$a;->g:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;->I(I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView$a;->h:Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
