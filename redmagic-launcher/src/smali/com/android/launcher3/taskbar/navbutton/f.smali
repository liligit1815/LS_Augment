.class public final synthetic Lcom/android/launcher3/taskbar/navbutton/f;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/navbutton/f;->g:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/navbutton/f;->g:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

    .line 2
    .line 3
    check-cast p1, Landroid/view/View;

    .line 4
    .line 5
    check-cast p2, Landroid/view/View;

    .line 6
    .line 7
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->b(Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;Landroid/view/View;Landroid/view/View;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
