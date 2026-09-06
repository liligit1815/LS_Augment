.class public final synthetic Lcom/android/quickstep/f1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/ImageActionsApi;

.field public final synthetic h:Landroid/graphics/Rect;

.field public final synthetic i:Landroid/content/Intent;

.field public final synthetic j:Z

.field public final synthetic k:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/ImageActionsApi;Landroid/graphics/Rect;Landroid/content/Intent;ZLjava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/f1;->g:Lcom/android/quickstep/ImageActionsApi;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/f1;->h:Landroid/graphics/Rect;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/quickstep/f1;->i:Landroid/content/Intent;

    .line 9
    .line 10
    iput-boolean p4, p0, Lcom/android/quickstep/f1;->j:Z

    .line 11
    .line 12
    iput-object p5, p0, Lcom/android/quickstep/f1;->k:Ljava/lang/Runnable;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/f1;->g:Lcom/android/quickstep/ImageActionsApi;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/f1;->h:Landroid/graphics/Rect;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/f1;->i:Landroid/content/Intent;

    .line 6
    .line 7
    iget-boolean v3, p0, Lcom/android/quickstep/f1;->j:Z

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/quickstep/f1;->k:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-static {v0, v1, v2, v3, p0}, Lcom/android/quickstep/ImageActionsApi;->a(Lcom/android/quickstep/ImageActionsApi;Landroid/graphics/Rect;Landroid/content/Intent;ZLjava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
