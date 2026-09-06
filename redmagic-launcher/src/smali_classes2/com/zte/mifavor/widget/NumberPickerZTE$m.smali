.class Lcom/zte/mifavor/widget/NumberPickerZTE$m;
.super Ljava/lang/Object;
.source "NumberPickerZTE.java"

# interfaces
.implements Lcom/zte/mifavor/widget/NumberPickerZTE$g;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/mifavor/widget/NumberPickerZTE;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "m"
.end annotation


# instance fields
.field final a:Ljava/lang/StringBuilder;

.field final b:[Ljava/lang/Object;

.field c:C

.field d:Ljava/util/Formatter;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$m;->a:Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    new-array v0, v0, [Ljava/lang/Object;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$m;->b:[Ljava/lang/Object;

    .line 15
    .line 16
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-direct {p0, v0}, Lcom/zte/mifavor/widget/NumberPickerZTE$m;->d(Ljava/util/Locale;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private b(Ljava/util/Locale;)Ljava/util/Formatter;
    .locals 1

    .line 1
    new-instance v0, Ljava/util/Formatter;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$m;->a:Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v0, p0, p1}, Ljava/util/Formatter;-><init>(Ljava/lang/Appendable;Ljava/util/Locale;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method private static c(Ljava/util/Locale;)C
    .locals 0

    .line 1
    invoke-static {p0}, Llibcore/icu/LocaleData;->get(Ljava/util/Locale;)Llibcore/icu/LocaleData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-char p0, p0, Llibcore/icu/LocaleData;->zeroDigit:C

    .line 6
    .line 7
    return p0
.end method

.method private d(Ljava/util/Locale;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/NumberPickerZTE$m;->b(Ljava/util/Locale;)Ljava/util/Formatter;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$m;->d:Ljava/util/Formatter;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/zte/mifavor/widget/NumberPickerZTE$m;->c(Ljava/util/Locale;)C

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput-char p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$m;->c:C

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a(I)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-char v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$m;->c:C

    .line 6
    .line 7
    invoke-static {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE$m;->c(Ljava/util/Locale;)C

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-eq v1, v2, :cond_0

    .line 12
    .line 13
    invoke-direct {p0, v0}, Lcom/zte/mifavor/widget/NumberPickerZTE$m;->d(Ljava/util/Locale;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$m;->b:[Ljava/lang/Object;

    .line 17
    .line 18
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const/4 v1, 0x0

    .line 23
    aput-object p1, v0, v1

    .line 24
    .line 25
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$m;->a:Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-virtual {p1, v1, v0}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$m;->d:Ljava/util/Formatter;

    .line 35
    .line 36
    const-string v0, "%02d"

    .line 37
    .line 38
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$m;->b:[Ljava/lang/Object;

    .line 39
    .line 40
    invoke-virtual {p1, v0, v1}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$m;->d:Ljava/util/Formatter;

    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/util/Formatter;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0
.end method
