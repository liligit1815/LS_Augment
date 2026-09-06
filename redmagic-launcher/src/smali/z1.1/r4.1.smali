.class public final synthetic Lz1/r4;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/app/prediction/AppPredictor$Callback;


# instance fields
.field public final synthetic a:Lz1/w4;

.field public final synthetic b:Lz1/w4$a;


# direct methods
.method public synthetic constructor <init>(Lz1/w4;Lz1/w4$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lz1/r4;->a:Lz1/w4;

    .line 5
    .line 6
    iput-object p2, p0, Lz1/r4;->b:Lz1/w4$a;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onTargetsAvailable(Ljava/util/List;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lz1/r4;->a:Lz1/w4;

    .line 2
    .line 3
    iget-object p0, p0, Lz1/r4;->b:Lz1/w4$a;

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, Lz1/w4;->m(Lz1/w4;Lz1/w4$a;Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
