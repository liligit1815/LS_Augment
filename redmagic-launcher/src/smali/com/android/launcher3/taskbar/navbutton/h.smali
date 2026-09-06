.class public final synthetic Lcom/android/launcher3/taskbar/navbutton/h;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Function;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/navbutton/h;->a:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/navbutton/h;->a:Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;

    .line 2
    .line 3
    check-cast p1, Landroid/view/View;

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->a(Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;Landroid/view/View;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
