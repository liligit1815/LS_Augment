.class public final synthetic LV1/g;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements LM2/i$g;


# instance fields
.field public final synthetic a:LV1/y;

.field public final synthetic b:F

.field public final synthetic c:F

.field public final synthetic d:F

.field public final synthetic e:LV1/y$e;


# direct methods
.method public synthetic constructor <init>(LV1/y;FFFLV1/y$e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LV1/g;->a:LV1/y;

    .line 5
    .line 6
    iput p2, p0, LV1/g;->b:F

    .line 7
    .line 8
    iput p3, p0, LV1/g;->c:F

    .line 9
    .line 10
    iput p4, p0, LV1/g;->d:F

    .line 11
    .line 12
    iput-object p5, p0, LV1/g;->e:LV1/y$e;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Landroid/util/ArrayMap;)V
    .locals 7

    .line 1
    iget-object v0, p0, LV1/g;->a:LV1/y;

    .line 2
    .line 3
    iget v1, p0, LV1/g;->b:F

    .line 4
    .line 5
    iget v2, p0, LV1/g;->c:F

    .line 6
    .line 7
    iget v3, p0, LV1/g;->d:F

    .line 8
    .line 9
    iget-object v4, p0, LV1/g;->e:LV1/y$e;

    .line 10
    .line 11
    move-object v5, p1

    .line 12
    check-cast v5, Landroid/view/View;

    .line 13
    .line 14
    move-object v6, p2

    .line 15
    invoke-static/range {v0 .. v6}, LV1/y;->k(LV1/y;FFFLV1/y$e;Landroid/view/View;Landroid/util/ArrayMap;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
