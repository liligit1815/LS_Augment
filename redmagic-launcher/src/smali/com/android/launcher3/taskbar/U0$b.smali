.class Lcom/android/launcher3/taskbar/U0$b;
.super Ljava/lang/Object;
.source "StashedHandleViewController.java"

# interfaces
.implements LP2/d$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/U0;->p()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/taskbar/U0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/U0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/U0$b;->a:Lcom/android/launcher3/taskbar/U0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/U0$b;->a:Lcom/android/launcher3/taskbar/U0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/taskbar/U0;->g(Lcom/android/launcher3/taskbar/U0;)Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {v0, p1, v1}, Lcom/android/launcher3/taskbar/StashedHandleView;->c(ZZ)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/taskbar/U0$b;->a:Lcom/android/launcher3/taskbar/U0;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/android/launcher3/taskbar/U0;->c(Lcom/android/launcher3/taskbar/U0;)Landroid/content/SharedPreferences;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "stashed_handle_region_is_dark"

    .line 22
    .line 23
    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public c(Landroid/view/View;)Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/U0$b;->a:Lcom/android/launcher3/taskbar/U0;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/taskbar/U0;->g(Lcom/android/launcher3/taskbar/U0;)Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/StashedHandleView;->getSampledRegion()Landroid/graphics/Rect;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
