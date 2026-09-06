.class public final synthetic Lcom/android/launcher3/taskbar/Z1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/taskbar/j2;

.field public final synthetic h:Lcom/android/launcher3/BubbleTextView;

.field public final synthetic i:Ln1/d;

.field public final synthetic j:Landroid/graphics/Point;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/taskbar/j2;Lcom/android/launcher3/BubbleTextView;Ln1/d;Landroid/graphics/Point;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/taskbar/Z1;->g:Lcom/android/launcher3/taskbar/j2;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/taskbar/Z1;->h:Lcom/android/launcher3/BubbleTextView;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/taskbar/Z1;->i:Ln1/d;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/launcher3/taskbar/Z1;->j:Landroid/graphics/Point;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/Z1;->g:Lcom/android/launcher3/taskbar/j2;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/Z1;->h:Lcom/android/launcher3/BubbleTextView;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/taskbar/Z1;->i:Ln1/d;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/taskbar/Z1;->j:Landroid/graphics/Point;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Lcom/android/launcher3/taskbar/j2;->c0(Lcom/android/launcher3/taskbar/j2;Lcom/android/launcher3/BubbleTextView;Ln1/d;Landroid/graphics/Point;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
