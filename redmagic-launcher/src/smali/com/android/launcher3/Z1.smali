.class public final synthetic Lcom/android/launcher3/Z1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/C2;

.field public final synthetic h:Landroid/view/View;

.field public final synthetic i:Landroid/content/Intent;

.field public final synthetic j:Lcom/android/launcher3/model/data/y;

.field public final synthetic k:Lcom/android/launcher3/util/Y1;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/C2;Landroid/view/View;Landroid/content/Intent;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/util/Y1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/Z1;->g:Lcom/android/launcher3/C2;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/Z1;->h:Landroid/view/View;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/Z1;->i:Landroid/content/Intent;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/launcher3/Z1;->j:Lcom/android/launcher3/model/data/y;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/android/launcher3/Z1;->k:Lcom/android/launcher3/util/Y1;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/Z1;->g:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/Z1;->h:Landroid/view/View;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/Z1;->i:Landroid/content/Intent;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/launcher3/Z1;->j:Lcom/android/launcher3/model/data/y;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/Z1;->k:Lcom/android/launcher3/util/Y1;

    .line 10
    .line 11
    invoke-static {v0, v1, v2, v3, p0}, Lcom/android/launcher3/C2;->H0(Lcom/android/launcher3/C2;Landroid/view/View;Landroid/content/Intent;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/util/Y1;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
