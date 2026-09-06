.class public final synthetic LC3/n;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements LC3/D;


# instance fields
.field public final synthetic a:Lcom/google/gson/g;

.field public final synthetic b:Ljava/lang/reflect/Type;


# direct methods
.method public synthetic constructor <init>(Lcom/google/gson/g;Ljava/lang/reflect/Type;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LC3/n;->a:Lcom/google/gson/g;

    .line 5
    .line 6
    iput-object p2, p0, LC3/n;->b:Ljava/lang/reflect/Type;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, LC3/n;->a:Lcom/google/gson/g;

    .line 2
    .line 3
    iget-object p0, p0, LC3/n;->b:Ljava/lang/reflect/Type;

    .line 4
    .line 5
    invoke-static {v0, p0}, LC3/w;->g(Lcom/google/gson/g;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
