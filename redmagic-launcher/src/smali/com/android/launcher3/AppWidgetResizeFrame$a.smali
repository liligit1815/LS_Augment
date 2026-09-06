.class Lcom/android/launcher3/AppWidgetResizeFrame$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "AppWidgetResizeFrame.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/AppWidgetResizeFrame;->r0(Lcom/android/launcher3/CellLayout;Lcom/android/launcher3/CellLayout;FFLandroid/animation/AnimatorSet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/CellLayout;

.field final synthetic h:Z

.field final synthetic i:Lcom/android/launcher3/CellLayout;


# direct methods
.method constructor <init>(Lcom/android/launcher3/AppWidgetResizeFrame;Lcom/android/launcher3/CellLayout;ZLcom/android/launcher3/CellLayout;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/launcher3/AppWidgetResizeFrame$a;->g:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    iput-boolean p3, p0, Lcom/android/launcher3/AppWidgetResizeFrame$a;->h:Z

    .line 4
    .line 5
    iput-object p4, p0, Lcom/android/launcher3/AppWidgetResizeFrame$a;->i:Lcom/android/launcher3/CellLayout;

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame$a;->g:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/android/launcher3/AppWidgetResizeFrame$a;->h:Z

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lcom/android/launcher3/CellLayout;->setIsDragOverlapping(Z)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/launcher3/AppWidgetResizeFrame$a;->i:Lcom/android/launcher3/CellLayout;

    .line 9
    .line 10
    iget-boolean p0, p0, Lcom/android/launcher3/AppWidgetResizeFrame$a;->h:Z

    .line 11
    .line 12
    invoke-virtual {p1, p0}, Lcom/android/launcher3/CellLayout;->setIsDragOverlapping(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
