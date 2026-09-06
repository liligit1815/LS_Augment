.class public final synthetic Ln1/u;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/l;


# instance fields
.field public final synthetic g:Landroid/graphics/Path;

.field public final synthetic h:Landroid/graphics/Region;

.field public final synthetic i:Landroid/graphics/Region;

.field public final synthetic j:Landroid/graphics/Region;


# direct methods
.method public synthetic constructor <init>(Landroid/graphics/Path;Landroid/graphics/Region;Landroid/graphics/Region;Landroid/graphics/Region;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ln1/u;->g:Landroid/graphics/Path;

    .line 5
    .line 6
    iput-object p2, p0, Ln1/u;->h:Landroid/graphics/Region;

    .line 7
    .line 8
    iput-object p3, p0, Ln1/u;->i:Landroid/graphics/Region;

    .line 9
    .line 10
    iput-object p4, p0, Ln1/u;->j:Landroid/graphics/Region;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ln1/u;->g:Landroid/graphics/Path;

    .line 2
    .line 3
    iget-object v1, p0, Ln1/u;->h:Landroid/graphics/Region;

    .line 4
    .line 5
    iget-object v2, p0, Ln1/u;->i:Landroid/graphics/Region;

    .line 6
    .line 7
    iget-object p0, p0, Ln1/u;->j:Landroid/graphics/Region;

    .line 8
    .line 9
    check-cast p1, Ln1/t;

    .line 10
    .line 11
    invoke-static {v0, v1, v2, p0, p1}, Ln1/t$c;->a(Landroid/graphics/Path;Landroid/graphics/Region;Landroid/graphics/Region;Landroid/graphics/Region;Ln1/t;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method
