.class Lokhttp3/internal/connection/Transmitter$1;
.super Lokio/c;
.source "Transmitter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lokhttp3/internal/connection/Transmitter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lokhttp3/internal/connection/Transmitter;


# direct methods
.method constructor <init>(Lokhttp3/internal/connection/Transmitter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lokhttp3/internal/connection/Transmitter$1;->this$0:Lokhttp3/internal/connection/Transmitter;

    .line 2
    .line 3
    invoke-direct {p0}, Lokio/c;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method protected timedOut()V
    .locals 0

    .line 1
    iget-object p0, p0, Lokhttp3/internal/connection/Transmitter$1;->this$0:Lokhttp3/internal/connection/Transmitter;

    .line 2
    .line 3
    invoke-virtual {p0}, Lokhttp3/internal/connection/Transmitter;->cancel()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
