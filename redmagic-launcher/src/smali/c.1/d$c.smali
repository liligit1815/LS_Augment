.class Lc/d$c;
.super Lc/c;
.source "ActivityResultRegistry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/d;->j(Ljava/lang/String;Ld/a;Lc/b;)Lc/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lc/c<",
        "TI;>;"
    }
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ld/a;

.field final synthetic c:Lc/d;


# direct methods
.method constructor <init>(Lc/d;Ljava/lang/String;Ld/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lc/d$c;->c:Lc/d;

    .line 2
    .line 3
    iput-object p2, p0, Lc/d$c;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lc/d$c;->b:Ld/a;

    .line 6
    .line 7
    invoke-direct {p0}, Lc/c;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public b(Ljava/lang/Object;Landroidx/core/app/c;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TI;",
            "Landroidx/core/app/c;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lc/d$c;->c:Lc/d;

    .line 2
    .line 3
    iget-object v0, v0, Lc/d;->b:Ljava/util/Map;

    .line 4
    .line 5
    iget-object v1, p0, Lc/d$c;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Integer;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Lc/d$c;->c:Lc/d;

    .line 16
    .line 17
    iget-object v1, v1, Lc/d;->d:Ljava/util/ArrayList;

    .line 18
    .line 19
    iget-object v2, p0, Lc/d$c;->a:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    :try_start_0
    iget-object v1, p0, Lc/d$c;->c:Lc/d;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iget-object v2, p0, Lc/d$c;->b:Ld/a;

    .line 31
    .line 32
    invoke-virtual {v1, v0, v2, p1, p2}, Lc/d;->f(ILd/a;Ljava/lang/Object;Landroidx/core/app/c;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :catch_0
    move-exception p1

    .line 37
    iget-object p2, p0, Lc/d$c;->c:Lc/d;

    .line 38
    .line 39
    iget-object p2, p2, Lc/d;->d:Ljava/util/ArrayList;

    .line 40
    .line 41
    iget-object p0, p0, Lc/d$c;->a:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p2, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    throw p1

    .line 47
    :cond_0
    new-instance p2, Ljava/lang/IllegalStateException;

    .line 48
    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    const-string v1, "Attempting to launch an unregistered ActivityResultLauncher with contract "

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lc/d$c;->b:Ld/a;

    .line 60
    .line 61
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string p0, " and input "

    .line 65
    .line 66
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string p0, ". You must ensure the ActivityResultLauncher is registered before calling launch()."

    .line 73
    .line 74
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-direct {p2, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    throw p2
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Lc/d$c;->c:Lc/d;

    .line 2
    .line 3
    iget-object p0, p0, Lc/d$c;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lc/d;->l(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
