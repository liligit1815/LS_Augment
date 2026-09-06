.class LC3/B$c$a;
.super LC3/B$d;
.source "LinkedTreeMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LC3/B$c;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "LC3/B<",
        "TK;TV;>.d<TK;>;"
    }
.end annotation


# instance fields
.field final synthetic k:LC3/B$c;


# direct methods
.method constructor <init>(LC3/B$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, LC3/B$c$a;->k:LC3/B$c;

    .line 2
    .line 3
    iget-object p1, p1, LC3/B$c;->g:LC3/B;

    .line 4
    .line 5
    invoke-direct {p0, p1}, LC3/B$d;-><init>(LC3/B;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public next()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, LC3/B$d;->b()LC3/B$e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, LC3/B$e;->l:Ljava/lang/Object;

    .line 6
    .line 7
    return-object p0
.end method
