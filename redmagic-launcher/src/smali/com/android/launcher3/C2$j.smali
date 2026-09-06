.class Lcom/android/launcher3/C2$j;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/C2;->D2(IILandroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:I

.field final synthetic h:I

.field final synthetic i:Lcom/android/launcher3/util/O1;

.field final synthetic j:Lcom/android/launcher3/CellLayout;

.field final synthetic k:Lcom/android/launcher3/C2;


# direct methods
.method constructor <init>(Lcom/android/launcher3/C2;IILcom/android/launcher3/util/O1;Lcom/android/launcher3/CellLayout;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/C2$j;->k:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/C2$j;->g:I

    .line 4
    .line 5
    iput p3, p0, Lcom/android/launcher3/C2$j;->h:I

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/launcher3/C2$j;->i:Lcom/android/launcher3/util/O1;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/android/launcher3/C2$j;->j:Lcom/android/launcher3/CellLayout;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/C2$j;->k:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/C2$j;->g:I

    .line 4
    .line 5
    iget v2, p0, Lcom/android/launcher3/C2$j;->h:I

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/launcher3/C2$j;->i:Lcom/android/launcher3/util/O1;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2, v3}, Lcom/android/launcher3/C2;->r1(IILcom/android/launcher3/util/O1;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/C2$j;->j:Lcom/android/launcher3/CellLayout;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, v0}, Lcom/android/launcher3/CellLayout;->setDropPending(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
