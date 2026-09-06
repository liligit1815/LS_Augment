.class public final synthetic Lcom/android/launcher3/U0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/launcher3/X0;

.field public final synthetic h:Ljava/lang/String;

.field public final synthetic i:I

.field public final synthetic j:Ljava/util/ArrayList;

.field public final synthetic k:Z

.field public final synthetic l:Ljava/lang/String;

.field public final synthetic m:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/X0;Ljava/lang/String;ILjava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/U0;->g:Lcom/android/launcher3/X0;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/U0;->h:Ljava/lang/String;

    .line 7
    .line 8
    iput p3, p0, Lcom/android/launcher3/U0;->i:I

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/launcher3/U0;->j:Ljava/util/ArrayList;

    .line 11
    .line 12
    iput-boolean p5, p0, Lcom/android/launcher3/U0;->k:Z

    .line 13
    .line 14
    iput-object p6, p0, Lcom/android/launcher3/U0;->l:Ljava/lang/String;

    .line 15
    .line 16
    iput-object p7, p0, Lcom/android/launcher3/U0;->m:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/U0;->g:Lcom/android/launcher3/X0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/U0;->h:Ljava/lang/String;

    .line 4
    .line 5
    iget v2, p0, Lcom/android/launcher3/U0;->i:I

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/launcher3/U0;->j:Ljava/util/ArrayList;

    .line 8
    .line 9
    iget-boolean v4, p0, Lcom/android/launcher3/U0;->k:Z

    .line 10
    .line 11
    iget-object v5, p0, Lcom/android/launcher3/U0;->l:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v6, p0, Lcom/android/launcher3/U0;->m:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static/range {v0 .. v6}, Lcom/android/launcher3/X0;->e(Lcom/android/launcher3/X0;Ljava/lang/String;ILjava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
