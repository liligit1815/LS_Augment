.class public Lcom/android/launcher3/SecondaryDropTarget$a;
.super Ljava/lang/Object;
.source "SecondaryDropTarget.java"

# interfaces
.implements Lcom/android/launcher3/m0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/SecondaryDropTarget;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "a"
.end annotation


# instance fields
.field private final g:Lcom/android/launcher3/m0;

.field private final h:Landroid/content/Context;

.field protected i:Ljava/lang/String;

.field private j:Lcom/android/launcher3/n0$a;

.field final synthetic k:Lcom/android/launcher3/SecondaryDropTarget;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/SecondaryDropTarget;Lcom/android/launcher3/m0;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/SecondaryDropTarget$a;->k:Lcom/android/launcher3/SecondaryDropTarget;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/SecondaryDropTarget$a;->g:Lcom/android/launcher3/m0;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/SecondaryDropTarget$a;->h:Landroid/content/Context;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    return-void
.end method

.method public b()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/SecondaryDropTarget$a;->j:Lcom/android/launcher3/n0$a;

    .line 2
    .line 3
    iget-boolean v1, v0, Lcom/android/launcher3/n0$a;->j:Z

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Lcom/android/launcher3/SecondaryDropTarget$a;->g:Lcom/android/launcher3/m0;

    .line 8
    .line 9
    iput-object v1, v0, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    iput-boolean v2, v0, Lcom/android/launcher3/n0$a;->j:Z

    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/SecondaryDropTarget$a;->k:Lcom/android/launcher3/SecondaryDropTarget;

    .line 15
    .line 16
    invoke-static {p0}, Lcom/android/launcher3/SecondaryDropTarget;->H(Lcom/android/launcher3/SecondaryDropTarget;)Lcom/android/launcher3/n0$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-interface {v1, p0, v0, v2}, Lcom/android/launcher3/m0;->r(Landroid/view/View;Lcom/android/launcher3/n0$a;Z)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public r(Landroid/view/View;Lcom/android/launcher3/n0$a;Z)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/android/launcher3/SecondaryDropTarget$a;->j:Lcom/android/launcher3/n0$a;

    .line 2
    .line 3
    return-void
.end method
