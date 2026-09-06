.class public final synthetic Lcom/android/launcher3/taskbar/x3;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/launcher3/popup/P$i;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/taskbar/z3;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/taskbar/z3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/x3;->g:Lcom/android/launcher3/taskbar/z3;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Lcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/x3;->g:Lcom/android/launcher3/taskbar/z3;

    .line 2
    .line 3
    check-cast p1, Lcom/android/launcher3/taskbar/b;

    .line 4
    .line 5
    invoke-static {p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/z3;->b(Lcom/android/launcher3/taskbar/z3;Lcom/android/launcher3/taskbar/b;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Lcom/android/launcher3/popup/P;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
