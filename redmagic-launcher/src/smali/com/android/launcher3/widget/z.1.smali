.class public final synthetic Lcom/android/launcher3/widget/z;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/widget/C;

.field public final synthetic b:Ljava/util/ArrayList;

.field public final synthetic c:Ljava/util/ArrayList;

.field public final synthetic d:Ljava/util/ArrayList;

.field public final synthetic e:Ljava/util/ArrayList;

.field public final synthetic f:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/widget/C;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/widget/z;->a:Lcom/android/launcher3/widget/C;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/widget/z;->b:Ljava/util/ArrayList;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/widget/z;->c:Ljava/util/ArrayList;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/launcher3/widget/z;->d:Ljava/util/ArrayList;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/android/launcher3/widget/z;->e:Ljava/util/ArrayList;

    .line 13
    .line 14
    iput-object p6, p0, Lcom/android/launcher3/widget/z;->f:Ljava/util/ArrayList;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/z;->a:Lcom/android/launcher3/widget/C;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/widget/z;->b:Ljava/util/ArrayList;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/widget/z;->c:Ljava/util/ArrayList;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/launcher3/widget/z;->d:Ljava/util/ArrayList;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/android/launcher3/widget/z;->e:Ljava/util/ArrayList;

    .line 10
    .line 11
    iget-object v5, p0, Lcom/android/launcher3/widget/z;->f:Ljava/util/ArrayList;

    .line 12
    .line 13
    move-object v6, p1

    .line 14
    check-cast v6, Lm2/g;

    .line 15
    .line 16
    invoke-static/range {v0 .. v6}, Lcom/android/launcher3/widget/C;->g(Lcom/android/launcher3/widget/C;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Lm2/g;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
