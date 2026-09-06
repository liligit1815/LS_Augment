.class public final synthetic LV1/i;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements LM2/i$g;


# instance fields
.field public final synthetic a:F

.field public final synthetic b:LV1/y;

.field public final synthetic c:F

.field public final synthetic d:F


# direct methods
.method public synthetic constructor <init>(FLV1/y;FF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, LV1/i;->a:F

    .line 5
    .line 6
    iput-object p2, p0, LV1/i;->b:LV1/y;

    .line 7
    .line 8
    iput p3, p0, LV1/i;->c:F

    .line 9
    .line 10
    iput p4, p0, LV1/i;->d:F

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Landroid/util/ArrayMap;)V
    .locals 6

    .line 1
    iget v0, p0, LV1/i;->a:F

    .line 2
    .line 3
    iget-object v1, p0, LV1/i;->b:LV1/y;

    .line 4
    .line 5
    iget v2, p0, LV1/i;->c:F

    .line 6
    .line 7
    iget v3, p0, LV1/i;->d:F

    .line 8
    .line 9
    move-object v4, p1

    .line 10
    check-cast v4, Landroid/view/View;

    .line 11
    .line 12
    move-object v5, p2

    .line 13
    invoke-static/range {v0 .. v5}, LV1/y;->f(FLV1/y;FFLandroid/view/View;Landroid/util/ArrayMap;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
