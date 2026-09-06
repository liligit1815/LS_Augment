.class Lcom/android/launcher3/menu/MenuWallpaper$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "MenuWallpaper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/menu/MenuWallpaper;->m(Lcom/android/launcher3/menu/MenuItemView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/menu/MenuItemView;

.field final synthetic h:Lcom/android/launcher3/menu/MenuWallpaper;


# direct methods
.method constructor <init>(Lcom/android/launcher3/menu/MenuWallpaper;Lcom/android/launcher3/menu/MenuItemView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/menu/MenuWallpaper$a;->h:Lcom/android/launcher3/menu/MenuWallpaper;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/menu/MenuWallpaper$a;->g:Lcom/android/launcher3/menu/MenuItemView;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/menu/MenuWallpaper$a;->h:Lcom/android/launcher3/menu/MenuWallpaper;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/menu/MenuWallpaper$a;->g:Lcom/android/launcher3/menu/MenuItemView;

    .line 4
    .line 5
    invoke-static {p1, p0}, Lcom/android/launcher3/menu/MenuWallpaper;->c(Lcom/android/launcher3/menu/MenuWallpaper;Lcom/android/launcher3/menu/MenuItemView;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
