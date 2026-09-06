.class Lcom/android/launcher3/Workspace$e;
.super Ljava/lang/Object;
.source "Workspace.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/Workspace;->Y2()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/Workspace;


# direct methods
.method constructor <init>(Lcom/android/launcher3/Workspace;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/Workspace$e;->g:Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Workspace$e;->g:Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/android/launcher3/F1;->J1:Landroid/graphics/Point;

    .line 12
    .line 13
    iget v1, v0, Landroid/graphics/Point;->x:I

    .line 14
    .line 15
    iget-object v2, p0, Lcom/android/launcher3/Workspace$e;->g:Lcom/android/launcher3/Workspace;

    .line 16
    .line 17
    iget-object v2, v2, Lcom/android/launcher3/Workspace;->l:Landroid/app/WallpaperManager;

    .line 18
    .line 19
    invoke-virtual {v2}, Landroid/app/WallpaperManager;->getDesiredMinimumWidth()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-ne v1, v2, :cond_1

    .line 24
    .line 25
    iget v1, v0, Landroid/graphics/Point;->y:I

    .line 26
    .line 27
    iget-object v2, p0, Lcom/android/launcher3/Workspace$e;->g:Lcom/android/launcher3/Workspace;

    .line 28
    .line 29
    iget-object v2, v2, Lcom/android/launcher3/Workspace;->l:Landroid/app/WallpaperManager;

    .line 30
    .line 31
    invoke-virtual {v2}, Landroid/app/WallpaperManager;->getDesiredMinimumHeight()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eq v1, v2, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    return-void

    .line 39
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/android/launcher3/Workspace$e;->g:Lcom/android/launcher3/Workspace;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/android/launcher3/Workspace;->l:Landroid/app/WallpaperManager;

    .line 42
    .line 43
    iget v1, v0, Landroid/graphics/Point;->x:I

    .line 44
    .line 45
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 46
    .line 47
    invoke-virtual {p0, v1, v0}, Landroid/app/WallpaperManager;->suggestDesiredDimensions(II)V

    .line 48
    .line 49
    .line 50
    return-void
.end method
