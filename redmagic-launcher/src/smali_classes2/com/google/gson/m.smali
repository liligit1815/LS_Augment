.class public final Lcom/google/gson/m;
.super Lcom/google/gson/k;
.source "JsonNull.java"


# static fields
.field public static final g:Lcom/google/gson/m;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/gson/m;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/gson/m;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/google/gson/m;->g:Lcom/google/gson/m;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/google/gson/k;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    instance-of p0, p1, Lcom/google/gson/m;

    .line 2
    .line 3
    return p0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    const-class p0, Lcom/google/gson/m;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
