.class public final Lcom/android/launcher3/taskbar/TaskbarDividerPopupView$b;
.super Ljava/lang/Object;
.source "View.kt"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->X()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView$b;->g:Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView$b;->g:Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/a;->isOpen()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView$b;->g:Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0, v0}, Lcom/android/launcher3/a;->close(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method
