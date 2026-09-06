.class LC3/x$a;
.super Lcom/google/gson/z;
.source "Excluder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LC3/x;->a(Lcom/google/gson/f;Lcom/google/gson/reflect/a;)Lcom/google/gson/z;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/gson/z<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private volatile a:Lcom/google/gson/z;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/gson/z<",
            "TT;>;"
        }
    .end annotation
.end field

.field final synthetic b:Z

.field final synthetic c:Z

.field final synthetic d:Lcom/google/gson/f;

.field final synthetic e:Lcom/google/gson/reflect/a;

.field final synthetic f:LC3/x;


# direct methods
.method constructor <init>(LC3/x;ZZLcom/google/gson/f;Lcom/google/gson/reflect/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, LC3/x$a;->f:LC3/x;

    .line 2
    .line 3
    iput-boolean p2, p0, LC3/x$a;->b:Z

    .line 4
    .line 5
    iput-boolean p3, p0, LC3/x$a;->c:Z

    .line 6
    .line 7
    iput-object p4, p0, LC3/x$a;->d:Lcom/google/gson/f;

    .line 8
    .line 9
    iput-object p5, p0, LC3/x$a;->e:Lcom/google/gson/reflect/a;

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/google/gson/z;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private e()Lcom/google/gson/z;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/gson/z<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, LC3/x$a;->a:Lcom/google/gson/z;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    iget-object v0, p0, LC3/x$a;->d:Lcom/google/gson/f;

    .line 7
    .line 8
    iget-object v1, p0, LC3/x$a;->f:LC3/x;

    .line 9
    .line 10
    iget-object v2, p0, LC3/x$a;->e:Lcom/google/gson/reflect/a;

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, Lcom/google/gson/f;->n(Lcom/google/gson/A;Lcom/google/gson/reflect/a;)Lcom/google/gson/z;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, LC3/x$a;->a:Lcom/google/gson/z;

    .line 17
    .line 18
    return-object v0
.end method


# virtual methods
.method public b(Lcom/google/gson/stream/JsonReader;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/gson/stream/JsonReader;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-boolean v0, p0, LC3/x$a;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/google/gson/stream/JsonReader;->skipValue()V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-direct {p0}, LC3/x$a;->e()Lcom/google/gson/z;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0, p1}, Lcom/google/gson/z;->b(Lcom/google/gson/stream/JsonReader;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public d(Lcom/google/gson/stream/JsonWriter;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/gson/stream/JsonWriter;",
            "TT;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-boolean v0, p0, LC3/x$a;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/google/gson/stream/JsonWriter;->nullValue()Lcom/google/gson/stream/JsonWriter;

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-direct {p0}, LC3/x$a;->e()Lcom/google/gson/z;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/google/gson/z;->d(Lcom/google/gson/stream/JsonWriter;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
