.class public final synthetic LO0/m;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:LO0/r;

.field public final synthetic h:Lcom/android/launcher3/model/data/y;

.field public final synthetic i:I

.field public final synthetic j:[I

.field public final synthetic k:Z

.field public final synthetic l:Ljava/util/function/Consumer;


# direct methods
.method public synthetic constructor <init>(LO0/r;Lcom/android/launcher3/model/data/y;I[IZLjava/util/function/Consumer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LO0/m;->g:LO0/r;

    .line 5
    .line 6
    iput-object p2, p0, LO0/m;->h:Lcom/android/launcher3/model/data/y;

    .line 7
    .line 8
    iput p3, p0, LO0/m;->i:I

    .line 9
    .line 10
    iput-object p4, p0, LO0/m;->j:[I

    .line 11
    .line 12
    iput-boolean p5, p0, LO0/m;->k:Z

    .line 13
    .line 14
    iput-object p6, p0, LO0/m;->l:Ljava/util/function/Consumer;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, LO0/m;->g:LO0/r;

    .line 2
    .line 3
    iget-object v1, p0, LO0/m;->h:Lcom/android/launcher3/model/data/y;

    .line 4
    .line 5
    iget v2, p0, LO0/m;->i:I

    .line 6
    .line 7
    iget-object v3, p0, LO0/m;->j:[I

    .line 8
    .line 9
    iget-boolean v4, p0, LO0/m;->k:Z

    .line 10
    .line 11
    iget-object v5, p0, LO0/m;->l:Ljava/util/function/Consumer;

    .line 12
    .line 13
    invoke-static/range {v0 .. v5}, LO0/r;->k(LO0/r;Lcom/android/launcher3/model/data/y;I[IZLjava/util/function/Consumer;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
