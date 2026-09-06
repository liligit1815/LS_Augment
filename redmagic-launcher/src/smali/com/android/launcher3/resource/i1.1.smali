.class public final synthetic Lcom/android/launcher3/resource/i1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Ljava/util/ArrayList;

.field public final synthetic h:Lcom/android/launcher3/D3;

.field public final synthetic i:Lcom/android/launcher3/C2;

.field public final synthetic j:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;Lcom/android/launcher3/D3;Lcom/android/launcher3/C2;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/resource/i1;->g:Ljava/util/ArrayList;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/resource/i1;->h:Lcom/android/launcher3/D3;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/resource/i1;->i:Lcom/android/launcher3/C2;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/launcher3/resource/i1;->j:Ljava/util/ArrayList;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/resource/i1;->g:Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/resource/i1;->h:Lcom/android/launcher3/D3;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/resource/i1;->i:Lcom/android/launcher3/C2;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/resource/i1;->j:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Lcom/android/launcher3/resource/h1$e;->a(Ljava/util/ArrayList;Lcom/android/launcher3/D3;Lcom/android/launcher3/C2;Ljava/util/ArrayList;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
