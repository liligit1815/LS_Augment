.class public final synthetic Lcom/android/launcher3/taskbar/A4;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/taskbar/E4;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/taskbar/E4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/A4;->g:Lcom/android/launcher3/taskbar/E4;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/A4;->g:Lcom/android/launcher3/taskbar/E4;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/android/launcher3/taskbar/E4;->f(Lcom/android/launcher3/taskbar/E4;Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
